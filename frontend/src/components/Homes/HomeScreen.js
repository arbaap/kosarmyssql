import React from "react";
import { Tab, Container, Tabs } from "react-bootstrap";
import { Link } from "react-router-dom";
import LatestReportings from "../Reportings/LatestReportings";
import AcceptedReportings from "../Reportings/AcceptedReportings";
import FinishedReportings from "../Reportings/FinishedReportings";
import RejectedReportings from "../Reportings/RejectedReportings";

function HomeScreen() {
  return (
    <Container className="inic container">
      <div className="inic container">
        <h1 className="judul">Welcome to</h1>
        <h2 className="judul2">
          Sistem Informasi Pengaduan <br></br>Masyarakat Desa Kosar
        </h2>

        <div className="tampilanhome">
          <h2 className="text-center">
            <b>Complaint List</b>
          </h2>
          <Tabs
            defaultActiveKey="reportingterbaru"
            id="justify-tab-example"
            className="mb-3"
            justify
          >
            <Tab eventKey="reportingterbaru" title="Latest">
              <LatestReportings />
            </Tab>
            <Tab eventKey="reportingdiproses" title="Processed">
              <AcceptedReportings />
            </Tab>
            <Tab eventKey="reportingselesai" title="Resolved">
              <FinishedReportings />
            </Tab>
            <Tab eventKey="reportingditolak" title="Rejected">
              <RejectedReportings />
            </Tab>
          </Tabs>
          <div className="fixed-bottom w-50 m-auto">
            <Link to="/tambahkeluhan" className="btn pengaduan btn-block">
              Create Reporting
            </Link>
          </div>
        </div>
      </div>
    </Container>
  );
}

export default HomeScreen;
