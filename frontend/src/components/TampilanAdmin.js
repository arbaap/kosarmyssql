import axios from "axios";
import React, { useEffect, useState } from "react";
import { Container, Row, Col, Nav, Tab, Button, Table } from "react-bootstrap";
import Swal from "sweetalert2";
import { Bar } from "react-chartjs-2";
import { Chart, registerables } from "chart.js";
import { LinearScale } from "chart.js";

function Adminscreen() {
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
                <Dashboard />
              </Tab.Pane>
              <Tab.Pane eventKey="laporan">
                <Pengaduans />
                <Reportings />
              </Tab.Pane>
            </Tab.Content>
          </Col>
        </Row>
      </Tab.Container>
    </Container>
  );
}

export default Adminscreen;

export function Dashboard() {
  const [reportings, setReportings] = useState([]);
  const [totalreporting, setTotalReporting] = useState(0);
  const [totalreportingDiterima, setTotalReportingDiterima] = useState(0);
  const [totalreportingDitolak, setTotalReportingDitolak] = useState(0);
  const [totalreportingPending, setTotalReportingPending] = useState(0);
  const [totalreportingSelesai, setTotalReportingSelesai] = useState(0);

  Chart.register(...registerables);
  Chart.register(LinearScale);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const response = await axios.get("/reporting");
      const data = response.data.data;

      if (Array.isArray(data)) {
        setReportings(data);
        console.log(data);

        const totalReporting = data.length;
        setTotalReporting(totalReporting);

        const totalReportingDiterima = data.filter(
          (reporting) => reporting.work_status === "Diterima"
        ).length;
        setTotalReportingDiterima(totalReportingDiterima);

        const totalReportingSelesai = data.filter(
          (reporting) => reporting.work_status === "Selesai"
        ).length;
        setTotalReportingSelesai(totalReportingSelesai);

        const totalReportingDitolak = data.filter(
          (reporting) => reporting.work_status === "Ditolak"
        ).length;
        setTotalReportingDitolak(totalReportingDitolak);

        const totalReportingPending = data.filter(
          (reporting) => reporting.work_status === "Pending"
        ).length;
        setTotalReportingPending(totalReportingPending);
      }
    } catch (error) {
      console.error(error);
    }
  };
  const chartData = {
    labels: [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Okt",
      "Nov",
      "Des",
    ],

    datasets: [
      {
        label: "Total Reporting",
        type: "bar",
        data: [totalreporting],
        backgroundColor: "#02a0fc",
        borderWidth: 1,
        borderRadius: 10,
      },
      {
        label: "Proses",
        type: "bar",
        data: [totalreportingDiterima],
        backgroundColor: "#fec400",
        borderWidth: 1,
        borderRadius: 10,
      },
      {
        label: "Selesai",
        type: "bar",
        data: [totalreportingSelesai],
        backgroundColor: "#14bd96",
        borderWidth: 1,
        borderRadius: 10,
      },
      {
        label: "Ditolak",
        type: "bar",
        data: [totalreportingDitolak],
        backgroundColor: "#f12b2c",
        borderWidth: 1,
        borderRadius: 10,
      },
      {
        label: "Pending",
        type: "bar",
        data: [totalreportingPending],
        backgroundColor: "#696969",
        borderWidth: 1,
        borderRadius: 10,
      },
    ],
  };

  const options = {
    scales: {
      y: {
        type: "linear",
        beginAtZero: true,
      },
    },
  };

  return (
    <div className="dashboard-container">
      <h1>Dashboard</h1>
      <div className="laporanmasuk dashboard-box">
        <p> Masuk</p>
        <p className="angkas">{totalreporting}</p>
      </div>
      <div className="laporanditerima dashboard-box">
        <p>Diproses</p>
        <p className="angkas">{totalreportingDiterima}</p>
      </div>
      <div className="laporanselesai dashboard-box">
        <p>Selesai</p>
        <p className="angkas">{totalreportingSelesai}</p>
      </div>
      <div className="laporanditolak dashboard-box">
        <p>Ditolak</p>
        <p className="angkas">{totalreportingDitolak}</p>
      </div>
      <div className="laporanpending dashboard-box">
        <p>Pending</p>
        <p className="angkas">{totalreportingPending}</p>
      </div>
      <div className="chart-container justify-content-center">
        <h1>Statistik Laporan</h1>
        <div>
          <Bar data={chartData} options={options} />
        </div>
      </div>
    </div>
  );
}

export function Reportings() {
  const [reportings, setReportings] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage] = useState(5);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const response = await axios.get("/reporting");
      setReportings(response.data.data);
    } catch (error) {
      console.log(error);
    }
  };

  const terimareporting = (id, newStatus) => {
    axios
      .put(`/u/rep?id=${id}`, { work_status: newStatus })
      .then((response) => {
        console.log(response.data);
        // Memperbarui status pada state
        const updatedList = reportings.map((report) => {
          if (report.complaint_id === id) {
            return { ...report, work_status: newStatus };
          }
          return report;
        });
        setReportings(updatedList);
        Swal.fire("Okay", "Reporting Accepted", "success");
      })
      .catch((error) => {
        console.error(error);
        Swal.fire("Oops", "Something Went Wrong", "error");
      });
  };

  const tolakreporting = (id, newStatus) => {
    Swal.fire({
      title: "Alasan Penolakan",
      input: "textarea",
      inputPlaceholder: "Masukkan Alasan Penolakan",
      showCancelButton: true,
      confirmButtonText: "Tolak",
      cancelButtonText: "Batal",
      showLoaderOnConfirm: true,
      preConfirm: (reason) => {
        return axios
          .put(`/u/rep?id=${id}`, { work_status: newStatus, reason: reason })
          .then((response) => {
            console.log(response.data);
            const updatedList = reportings.map((report) => {
              if (report.complaint_id === id) {
                return { ...report, work_status: newStatus };
              }
              return report;
            });
            setReportings(updatedList);
            Swal.fire("Okay", "Reporting Rejected", "success");
          })
          .catch((error) => {
            console.error(error);
            Swal.fire("Oops", "Something Went Wrong", "error");
          });
      },
    });
  };

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  const filteredReportings = reportings.filter(
    (reporting) => reporting.work_status === "Pending"
  );

  const indexOfLastItem = currentPage * itemsPerPage;
  const indexOfFirstItem = indexOfLastItem - itemsPerPage;
  const currentItems = filteredReportings.slice(
    indexOfFirstItem,
    indexOfLastItem
  );

  return (
    <Row>
      <Col md={12}>
        <h1>Laporan Masuk</h1>

        <Table bordered>
          <thead>
            <tr>
              <th>No</th>
              <th>Nama</th>
              <th>Kategori Pengaduan</th>
              <th>Judul Pengaduan</th>
              <th>Isi Pengaduan</th>
              <th>Tanggal</th>
              <th>Aksi</th>
            </tr>
          </thead>

          <tbody>
            {currentItems.length > 0 ? (
              currentItems.map((reporting, index) => (
                <tr key={reporting._id}>
                  <td>{index + indexOfFirstItem + 1}</td>
                  <td>{reporting.complainants_name}</td>
                  <td>{reporting.complaint_category}</td>
                  <td>{reporting.complaint_title}</td>
                  <td style={{ width: "200px", wordBreak: "break-word" }}>
                    {reporting.description}
                  </td>

                  <td>
                    {new Date(reporting.createdAt).toLocaleDateString("en-US", {
                      month: "short",
                      day: "2-digit",
                      year: "numeric",
                    })}
                  </td>
                  <td>
                    {reporting.work_status !== "pending" && (
                      <Button
                        className="terimareporting"
                        onClick={() =>
                          terimareporting(reporting.complaint_id, "Diterima")
                        }
                      >
                        Terima
                      </Button>
                    )}
                    {reporting.work_status !== "pending" && (
                      <Button
                        variant="danger"
                        className="tolakreporting"
                        onClick={() =>
                          tolakreporting(reporting.complaint_id, "Ditolak")
                        }
                      >
                        Tolak
                      </Button>
                    )}
                  </td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="8">Tidak ada laporan yang tersedia.</td>
              </tr>
            )}
          </tbody>
        </Table>

        <Pagination
          currentPage={currentPage}
          itemsPerPage={itemsPerPage}
          totalItems={filteredReportings.length}
          onPageChange={handlePageChange}
        />
      </Col>
    </Row>
  );

  function Pagination({ currentPage, itemsPerPage, totalItems, onPageChange }) {
    const pageNumbers = Math.ceil(totalItems / itemsPerPage);

    return (
      <nav>
        <ul className="pagination">
          {Array.from({ length: pageNumbers }, (_, i) => i + 1).map(
            (pageNumber) => (
              <li
                key={pageNumber}
                className={`page-item${
                  currentPage === pageNumber ? " active" : ""
                }`}
              >
                <button
                  className="page-link"
                  onClick={() => onPageChange(pageNumber)}
                >
                  {pageNumber}
                </button>
              </li>
            )
          )}
        </ul>
      </nav>
    );
  }
}

export function Pengaduans() {
  const [reportings, setReportings] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [perPage] = useState(5);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const response = await axios.get("/reporting");
      setReportings(response.data.data);
    } catch (error) {
      console.log(error);
    }
  };

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  const indexOfLastReporting = currentPage * perPage;
  const indexOfFirstReporting = indexOfLastReporting - perPage;
  const currentReportings = reportings.slice(
    indexOfFirstReporting,
    indexOfLastReporting
  );

  const selesaireporting = (id, newStatus) => {
    axios
      .put(`/u/rep?id=${id}`, { work_status: newStatus })
      .then((response) => {
        console.log(response.data);
        const updatedList = reportings.map((report) => {
          if (report.complaint_id === id) {
            return { ...report, work_status: newStatus };
          }
          return report;
        });
        setReportings(updatedList);
        Swal.fire("Okay", "Reporting Accepted", "success");
      })
      .catch((error) => {
        console.error(error);
        Swal.fire("Oops", "Something Went Wrong", "error");
      });
  };

  return (
    <Row>
      <Col>
        <h1>Semua Laporan</h1>
        <Table bordered>
          <thead>
            <tr>
              <th>No</th>
              <th>Nama Warga</th>
              <th>Judul Pengaduan</th>
              <th>Alasan Ditolak</th>
              <th>Status</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            {currentReportings.map((reporting, index) => {
              let statusText = reporting.work_status;
              let statusClass = "";
              switch (reporting.work_status) {
                case "Pending":
                  return null;
                case "Diterima":
                  statusText = "Diproses";
                  statusClass = "status-diterima";
                  break;
                case "Ditolak":
                  statusClass = "status-ditolak";
                  break;
                case "Selesai":
                  statusClass = "status-selesai";
                  break;
                default:
                  break;
              }
              return (
                <tr key={reporting._id}>
                  <td>{index + indexOfFirstReporting + 1}</td>
                  <td>{reporting.complainants_name}</td>
                  <td>{reporting.complaint_title}</td>
                  <td style={{ width: "200px", wordBreak: "break-word" }}>
                    {reporting.reason}
                  </td>
                  <td className={statusClass}>{statusText}</td>
                  <td>
                    {reporting.work_status !== "Selesai" &&
                      reporting.work_status !== "Ditolak" && (
                        <Button
                          onClick={() =>
                            selesaireporting(reporting.complaint_id, "Selesai")
                          }
                        >
                          Selesai
                        </Button>
                      )}
                  </td>
                </tr>
              );
            })}
          </tbody>
        </Table>
        <Pagination
          currentPage={currentPage}
          perPage={perPage}
          totalReportings={reportings.length}
          onPageChange={handlePageChange}
        />
      </Col>
    </Row>
  );

  function Pagination({ currentPage, perPage, totalReportings, onPageChange }) {
    const pageNumbers = Math.ceil(totalReportings / perPage);

    return (
      <nav>
        <ul className="pagination">
          {Array.from({ length: pageNumbers }, (_, i) => i + 1).map(
            (pageNumber) => (
              <li
                key={pageNumber}
                className={`page-item${
                  currentPage === pageNumber ? " active" : ""
                }`}
              >
                <button
                  className="page-link"
                  onClick={() => onPageChange(pageNumber)}
                >
                  {pageNumber}
                </button>
              </li>
            )
          )}
        </ul>
      </nav>
    );
  }
}
