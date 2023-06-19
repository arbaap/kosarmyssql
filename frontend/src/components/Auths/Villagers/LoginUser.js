import React, { useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import Swal from "sweetalert2";
import Modal from "react-bootstrap/Modal";
import Button from "react-bootstrap/Button";

import Card from "react-bootstrap/Card";
import logo from "../../../assets/subang.png";

function LoginUser() {
  const [nik, setNik] = useState("");
  const [password, setPassword] = useState("");


  
  async function login() {
    const credentials = {
      nik,
      password,
    };

    try {
      const response = await axios.post("/user/log", credentials);

      if (response.status === 200) {
        if (response.data.status === "Success" && response.data.code === 200) {
          const userData = {
            user_id: response.data.user_id,
            nik,
            email: response.data.email,
            name: response.data.name,
          };

          sessionStorage.setItem("villagers", JSON.stringify(userData));
          console.log(userData);
          Swal.fire("Success", "Login Successful", "success").then((result) => {
            window.location.href = "/home";
          });
        } else {
          Swal.fire("Oops", "Invalid credentials", "error");
        }
      } else {
        Swal.fire("Oops", "Invalid credentials", "error");
      }
    } catch (error) {
      Swal.fire("Oops", "Wrong Username and Password", "error");
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
                <h2>Welcome to</h2>
                <h1>Sistem Informasi Pengaduan Masyarakat Desa Kosar</h1>
              </Card.Title>
              <Card.Text>
                <h2 className="judullogin">Login Villagers</h2>
                <input
                  type="text"
                  className="form-control"
                  placeholder="NIK"
                  value={nik}
                  onChange={(e) => setNik(e.target.value)}
                />
                <input
                  type="password"
                  className="form-control"
                  placeholder="Password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                />
                <button className="btnlogin btn btn-block" onClick={login}>
                  Login
                </button>
                <div className="mt-2 text-center" style={{ color: "black" }}>
                  <Link to="/reguser" className="">
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

export default LoginUser;
