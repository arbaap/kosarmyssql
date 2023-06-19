import React, { useEffect, useState } from "react";
import axios from "axios";
import { useParams, Link } from "react-router-dom";
import { Container, Row, Col, Tab, Nav, Card } from "react-bootstrap";
import { IoArrowBackOutline } from "react-icons/io5";

function ProfileScreen() {
  const [nik, setNik] = useState("");
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");

  useEffect(() => {
    const userData = sessionStorage.getItem("villagers");
    if (userData) {
      const { nik, name, email } = JSON.parse(userData);
      setNik(nik);
      setName(name);
      setEmail(email);
    }
  }, []);

  return (
    <Container>
      <div className="header">
        <div className="backbutton">
          <Link to="/home">
            <IoArrowBackOutline size={30} color="white" />
          </Link>
        </div>
        <div className="juduldetailpengaduan">
          <h1>Profile Users</h1>
        </div>
      </div>
      <div className="bs">
        <Tab.Container id="left-tabs-example" defaultActiveKey="history">
          <Row>
            <Col sm={3}>
              <Nav variant="pills" className="flex-column">
                <Nav.Item>
                  <Nav.Link eventKey="history">History</Nav.Link>
                </Nav.Item>
                <Nav.Item>
                  <Nav.Link eventKey="profile">My Profile</Nav.Link>
                </Nav.Item>
              </Nav>
            </Col>
            <Col sm={9}>
              <Tab.Content>
                <Tab.Pane eventKey="profile">
                  <Card>
                    <Card.Body>
                      <Card.Title
                        style={{ marginBottom: "30px", fontWeight: "bold" }}
                      >
                        My Profile
                      </Card.Title>
                      <Card.Title className="myprf">NIK</Card.Title>
                      <Card.Text>{nik}</Card.Text>
                      <Card.Title className="myprf">Name</Card.Title>
                      <Card.Text>{name}</Card.Text>
                      <Card.Title className="myprf">Email</Card.Title>
                      <Card.Text>{email}</Card.Text>
                    </Card.Body>
                  </Card>
                </Tab.Pane>
                <Tab.Pane eventKey="history">
                  <Container>
                    <MyBookings />
                  </Container>
                </Tab.Pane>
              </Tab.Content>
            </Col>
          </Row>
        </Tab.Container>
      </div>
    </Container>
  );
}

export default ProfileScreen;

export function MyBookings() {
  const [reportingData, setReportingData] = useState([]);
  const userData = JSON.parse(sessionStorage.getItem("villagers"));
  const userId = userData ? userData.user_id : null;

  useEffect(() => {
    if (userId) {
      fetchReportingData();
    }
  }, [userId]);

  const fetchReportingData = async () => {
    try {
      const response = await axios.get("/reporting/byUserId", {
        params: {
          userId: userId,
        },
      });
      const data = response.data.data;
      setReportingData(data);
    } catch (error) {
      console.log(error);
    }
  };

  const getStatusColor = (status) => {
    switch (status) {
      case "Pending":
        return "status-pending-prof";
      case "Diterima":
        return "status-diterima-prof";
      case "Ditolak":
        return "status-ditolak-prof";
      case "Selesai":
        return "status-selesai-prof";
      default:
        return null;
    }
  };

  return (
    <Container>
      <Card>
        <Card.Body>
          <Card.Title style={{ fontWeight: "bold" }}>Reporting Data</Card.Title>
        </Card.Body>
      </Card>

      {reportingData.map((report) => (
        <Card key={report.complaint_id} className="my-3">
          <Card.Body>
            <Card.Title
              className="myprf"
              style={{
                marginBottom: "30px",
                fontWeight: "bold",
                textAlign: "center",
              }}
            >
              {report.complaint_title}
            </Card.Title>
            <Card.Title className="myprf">Complainants Name</Card.Title>
            <Card.Text>{report.complainants_name}</Card.Text>
            <Card.Title className="myprf">Complaint Category</Card.Title>
            <Card.Text>{report.complaint_category}</Card.Text>
            <Card.Title className="myprf">Description</Card.Title>
            <Card.Text>{report.description}</Card.Text>
            <Card.Title className="myprf">Work Status</Card.Title>
            <Card.Text className={getStatusColor(report.work_status)}>
              {report.work_status}
            </Card.Text>
          </Card.Body>
        </Card>
      ))}
    </Container>
  );
}
