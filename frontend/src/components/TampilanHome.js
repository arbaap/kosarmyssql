import axios from "axios";
import React, { useEffect, useState } from "react";
import { Tab, Tabs } from "react-bootstrap";
import ModalKeluhan from "./ModalKeluhan";
import { Link } from "react-router-dom";

function TampilanHome() {
  return (
    <div className="inic container">
      <h1 className="judul">Selamat Datang</h1>
      <h2 className="judul2">
        Di Sistem Informasi Pengaduan <br></br>Masyarakat Desa Kosar
      </h2>

      <div className="tampilanhome">
        <h2 className="text-center">
          <b>Daftar Pengaduan</b>
        </h2>
        <Tabs
          defaultActiveKey="reportingterbaru"
          id="justify-tab-example"
          className="mb-3"
          justify
        >
          <Tab eventKey="reportingterbaru" title="Terbaru">
            <Terbaru />
          </Tab>
          <Tab eventKey="reportingdiproses" title="Diproses">
            <DiProses />
          </Tab>
          <Tab eventKey="reportingselesai" title="Selesai">
            <Selesai />
          </Tab>
          <Tab eventKey="reportingditolak" title="Ditolak">
            <DiTolak />
          </Tab>
        </Tabs>
        <div className="fixed-bottom w-50 m-auto">
          <Link to="/tambahkeluhan" className="btn pengaduan btn-block">
            Buat Pengaduan
          </Link>
        </div>
      </div>
    </div>
  );
}

export default TampilanHome;

export function Terbaru() {
  const [reportings, setreportings] = useState([]);

  const [duplicatereportings, setduplicatereportings] = useState([]);
  const [searchkey, setsearchkey] = useState();
  const [complaint_category, setcomplaint_category] = useState("all");

  useEffect(() => {
    (async () => {
      try {
        const response = await axios.get("/reporting");
        const data = response.data.data; // Mengambil data dari properti 'data'
        setreportings(data);
        console.log(data);
      } catch (error) {
        console.log(error);
      }
    })();
  }, []);

  function filterBySearch() {
    const tempreportings = duplicatereportings.filter((reporting) =>
      reporting.complainants_name
        .toLowerCase()
        .includes(searchkey.toLowerCase())
    );

    setreportings(tempreportings);
  }

  function filterByType(e) {
    setcomplaint_category(e);

    if (e !== "all") {
      const tempreportings = duplicatereportings.filter(
        (reporting) =>
          reporting.complaint_category.toLowerCase() === e.toLowerCase()
      );
      setreportings(tempreportings);
    } else {
      setreportings(duplicatereportings);
    }
  }

  const sortedreportings = reportings.sort((a, b) => b.vote - a.vote);

  return (
    <div className="row justify-content-center">
      <div className="row">
        <div className="col-sm mb-4">
          {" "}
          <input
            type="text"
            className="form-control"
            placeholder="Cari"
            value={searchkey}
            onChange={(e) => {
              setsearchkey(e.target.value);
            }}
            onKeyUp={filterBySearch}
          />
        </div>
        <div className="col-sm">
          {" "}
          <select
            className="form-control custom-select"
            value={complaint_category}
            onChange={(e) => {
              filterByType(e.target.value);
            }}
          >
            <option value="all">Pilih Kategori</option>
            <option value="Infrastruktur">Infrastruktur</option>
            <option value="Pelayanan Publik">Pelayan Publik</option>
            <option value="Keamanan dan Ketertiban">
              Keamanan dan Ketertiban
            </option>
            <option value="Kesehatan Masyarakat">Kesehatan Masyarakat</option>
            <option value="Lingkungan">Lingkungan</option>
          </select>
        </div>
      </div>
      <div className="row justify-content-center">
        {" "}
        {sortedreportings.length &&
          sortedreportings.map((reporting, index) => {
            return (
              <div className="modals col-md-9">
                <ModalKeluhan reporting={reporting} index={index} />
              </div>
            );
          })}
      </div>
    </div>
  );
}

export function Selesai() {
  const [reportings, setreportings] = useState([]);

  const [duplicatereportings, setduplicatereportings] = useState([]);
  const [searchkey, setsearchkey] = useState();
  const [complaint_category, setcomplaint_category] = useState("all");

  useEffect(() => {
    (async () => {
      try {
        const response = await axios.get("/reporting");
        const data = response.data.data;
        setreportings(data);
        setduplicatereportings(data);
        console.log(data);
      } catch (error) {
        console.log(error);
      }
    })();
  }, []);

  function filterBySearch() {
    const tempreportings = duplicatereportings.filter((reporting) =>
      reporting.complainants_name
        .toLowerCase()
        .includes(searchkey.toLowerCase())
    );

    setreportings(tempreportings);
  }

  function filterByType(e) {
    setcomplaint_category(e);

    if (e !== "all") {
      const tempreportings = duplicatereportings.filter(
        (reporting) =>
          reporting.complaint_category.toLowerCase() === e.toLowerCase()
      );
      setreportings(tempreportings);
    } else {
      setreportings(duplicatereportings);
    }
  }

  const reportingsSelesai = reportings.filter(
    (reporting) => reporting.work_status === "Selesai"
  );

  const sortedreportings = reportingsSelesai.sort((a, b) => b.vote - a.vote);

  return (
    <div className="row justify-content-center">
      <div className="row">
        <div className="col-sm mb-4">
          {" "}
          <input
            type="text"
            className="form-control"
            placeholder="Cari"
            value={searchkey}
            onChange={(e) => {
              setsearchkey(e.target.value);
            }}
            onKeyUp={filterBySearch}
          />
        </div>
        <div className="col-sm">
          {" "}
          <select
            className="form-control custom-select"
            value={complaint_category}
            onChange={(e) => {
              filterByType(e.target.value);
            }}
          >
            <option value="all">Pilih Kategori</option>
            <option value="Infrastruktur">Infrastruktur</option>
            <option value="Pelayanan Publik">Pelayan Publik</option>
            <option value="Keamanan dan Ketertiban">
              Keamanan dan Ketertiban
            </option>
            <option value="Kesehatan Masyarakat">Kesehatan Masyarakat</option>
            <option value="Lingkungan">Lingkungan</option>
          </select>
        </div>
      </div>
      <div className="row justify-content-center">
        {reportingsSelesai.length > 0
          ? reportingsSelesai.map((reporting, index) => {
              return (
                <div className="modals col-md-9">
                  <ModalKeluhan reporting={reporting} index={index} />
                </div>
              );
            })
          : console.log}
      </div>
    </div>
  );
}

export function DiProses() {
  const [reportings, setreportings] = useState([]);

  const [duplicatereportings, setduplicatereportings] = useState([]);
  const [searchkey, setsearchkey] = useState();
  const [complaint_category, setcomplaint_category] = useState("all");

  useEffect(() => {
    (async () => {
      try {
        const response = await axios.get("/reporting");
        const data = response.data.data; // Mengambil data dari properti 'data'
        setreportings(data);
        setduplicatereportings(data);
        console.log(data);
      } catch (error) {
        console.log(error);
      }
    })();
  }, []);

  function filterBySearch() {
    const tempreportings = duplicatereportings.filter((reporting) =>
      reporting.complainants_name
        .toLowerCase()
        .includes(searchkey.toLowerCase())
    );

    setreportings(tempreportings);
  }

  function filterByType(e) {
    setcomplaint_category(e);

    if (e !== "all") {
      const tempreportings = duplicatereportings.filter(
        (reporting) =>
          reporting.complaint_category.toLowerCase() === e.toLowerCase()
      );
      setreportings(tempreportings);
    } else {
      setreportings(duplicatereportings);
    }
  }

  const reportingsDiProses = reportings
    .filter((reporting) => reporting.work_status === "Diterima")
    .map((reporting) => ({
      ...reporting,
      work_status: "Diproses",
    }));

  // const reportingsDiProses = reportings.filter(
  //   (reporting) => reporting.work_status === "Diterima"
  // );

  const sortedreportings = reportingsDiProses.sort((a, b) => b.vote - a.vote);

  return (
    <div className="row justify-content-center">
      <div className="row">
        <div className="col-sm mb-4">
          {" "}
          <input
            type="text"
            className="form-control"
            placeholder="Cari"
            value={searchkey}
            onChange={(e) => {
              setsearchkey(e.target.value);
            }}
            onKeyUp={filterBySearch}
          />
        </div>
        <div className="col-sm">
          {" "}
          <select
            className="form-control custom-select"
            value={complaint_category}
            onChange={(e) => {
              filterByType(e.target.value);
            }}
          >
            <option value="all">Pilih Kategori</option>
            <option value="Infrastruktur">Infrastruktur</option>
            <option value="Pelayanan Publik">Pelayan Publik</option>
            <option value="Keamanan dan Ketertiban">
              Keamanan dan Ketertiban
            </option>
            <option value="Kesehatan Masyarakat">Kesehatan Masyarakat</option>
            <option value="Lingkungan">Lingkungan</option>
          </select>
        </div>
      </div>

      <div className="row justify-content-center">
        {" "}
        {reportingsDiProses.length > 0 ? (
          reportingsDiProses.map((reporting, index) => (
            <div className="col-md-9">
              <ModalKeluhan reporting={reporting} index={index} />
            </div>
          ))
        ) : (
          <p>Tidak ada reporting yang sedang diproses.</p>
        )}
      </div>
    </div>
  );
}

export function DiTolak() {
  const [reportings, setreportings] = useState([]);

  const [duplicatereportings, setduplicatereportings] = useState([]);
  const [searchkey, setsearchkey] = useState();
  const [complaint_category, setcomplaint_category] = useState("all");

  useEffect(() => {
    (async () => {
      try {
        const response = await axios.get("/reporting");
        const data = response.data.data;
        setreportings(data);
        setduplicatereportings(data);
        console.log(data);
      } catch (error) {
        console.log(error);
      }
    })();
  }, []);

  function filterBySearch() {
    const tempreportings = duplicatereportings.filter((reporting) =>
      reporting.complainants_name
        .toLowerCase()
        .includes(searchkey.toLowerCase())
    );

    setreportings(tempreportings);
  }

  function filterByType(e) {
    setcomplaint_category(e);

    if (e !== "all") {
      const tempreportings = duplicatereportings.filter(
        (reporting) =>
          reporting.complaint_category.toLowerCase() === e.toLowerCase()
      );
      setreportings(tempreportings);
    } else {
      setreportings(duplicatereportings);
    }
  }

  const reportingsDitolak = reportings.filter(
    (reporting) => reporting.work_status === "Ditolak"
  );

  const sortedreportings = reportingsDitolak.sort((a, b) => b.vote - a.vote);

  return (
    <div className="row justify-content-center">
      <div className="row">
        <div className="col-sm mb-4">
          {" "}
          <input
            type="text"
            className="form-control"
            placeholder="Cari"
            value={searchkey}
            onChange={(e) => {
              setsearchkey(e.target.value);
            }}
            onKeyUp={filterBySearch}
          />
        </div>
        <div className="col-sm">
          {" "}
          <select
            className="form-control custom-select"
            value={complaint_category}
            onChange={(e) => {
              filterByType(e.target.value);
            }}
          >
            <option value="all">Pilih Kategori</option>
            <option value="Infrastruktur">Infrastruktur</option>
            <option value="Pelayanan Publik">Pelayan Publik</option>
            <option value="Keamanan dan Ketertiban">
              Keamanan dan Ketertiban
            </option>
            <option value="Kesehatan Masyarakat">Kesehatan Masyarakat</option>
            <option value="Lingkungan">Lingkungan</option>
          </select>
        </div>
      </div>
      <div className="row justify-content-center">
        {" "}
        {reportingsDitolak.length > 0 ? (
          reportingsDitolak.map((reporting, index) => {
            return (
              <div className="col-md-9">
                <ModalKeluhan reporting={reporting} index={index} />
              </div>
            );
          })
        ) : (
          <p>Tidak ada reporting yang ditolak.</p>
        )}
      </div>
    </div>
  );
}
