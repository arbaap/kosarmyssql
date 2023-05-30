import React, { useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import Swal from "sweetalert2";

import Card from "react-bootstrap/Card";
import logo from "../assets/subang.png";

function TampilanLogin() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  async function login() {
    const credentials = {
      username,
      password,
    };

    try {
      const response = await axios.post("/c/login", credentials);
      console.log(response.data);

      if (response.status === 200) {
        Swal.fire("Success", "Login Successful", "success").then((result) => {
          // Lakukan tindakan lain setelah berhasil login...
          // Contoh: Pindah ke halaman lain atau tampilkan notifikasi lainnya
          window.location.href = "/admin";
        });
      } else {
        Swal.fire("Oops", "Invalid credentials", "error");
        console.log(response);
      }
    } catch (error) {
      Swal.fire("Oops", "Error occurred during login", "error");
      console.log(error);
    }
  }

  return (
    <div className="container">
      <div className="row justify-content-center mt-5">
        <div className="col">
          <Card className="cardmodal">
            <Card.Body>
              <Card.Title className="text-center">
                <img className="img-logo" src={logo} alt="" />
                <h2>Selamat datang di</h2>
                <h1>Sistem Informasi Pengaduan Masyarakat Desa Kosar</h1>
              </Card.Title>
              <Card.Text>
                <h2 className="judullogin">Masuk</h2>
                <input
                  type="text"
                  className="form-control"
                  placeholder="Username"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                />
                <input
                  type="password"
                  className="form-control"
                  placeholder="Password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                />
                <button className="btnlogin btn btn-block" onClick={login}>
                  Masuk
                </button>
                <div className="mt-2 text-center" style={{ color: "black" }}>
                  <Link to="/register" className="">
                    Register ? ...
                  </Link>
                </div>
              </Card.Text>
            </Card.Body>
          </Card>
        </div>
      </div>
    </div>
  );
}

export default TampilanLogin;
