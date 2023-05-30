import React from "react";
import { Container, Row, Col, Nav, Tab } from "react-bootstrap";
import AdminDashboard from "./AdminDashboard";
import AdminReportings from "./AdminReportings";
import AdminReport from "./AdminReport";

function AdminPanel() {
  return (
    <Container className="tampilanadmin">
      <Tab.Container id="left-tabs-example" defaultActiveKey="laporan">
        <Row className="">
          <Col sm={3}>
            <Nav variant="pills" className="flex-column">
              <h2>
                <b>Admin Panel</b>
              </h2>
              <Nav.Item>
                <Nav.Link eventKey="dashboard">Dashboard</Nav.Link>
              </Nav.Item>
              <Nav.Item>
                <Nav.Link eventKey="laporan">Laporan</Nav.Link>
              </Nav.Item>
            </Nav>
          </Col>
          <Col sm={9}>
            <Tab.Content>
              <Tab.Pane eventKey="dashboard">
                <AdminDashboard />
              </Tab.Pane>
              <Tab.Pane eventKey="laporan">
                <AdminReportings />
                <AdminReport />
              </Tab.Pane>
            </Tab.Content>
          </Col>
        </Row>
      </Tab.Container>
    </Container>
  );
}

export default AdminPanel;
