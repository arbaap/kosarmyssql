import React, { useState } from "react";
import axios from "axios";
import Swal from "sweetalert2";

function RegisterUser() {
  const [nik, setNIK] = useState("");
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  async function register() {
    const villagers = {
      nik,
      name,
      email,
      password,
    };

    try {
      const response = await axios.post("/user/reg", villagers);
      console.log(response.data); // Menampilkan respon dari server

      // Lakukan tindakan sesuai dengan respon dari server
      if (response.status === 200) {
        Swal.fire("Congrats", "Villagers Created Successfully", "success").then(
          (result) => {
            // Lakukan tindakan lain setelah berhasil membuat karyawan...
            // Contoh: Pindah ke halaman lain atau tampilkan notifikasi lainnya
            window.location.href = "/loguser";
          }
        );
      } else {
        Swal.fire("Oops", "Something went wrong", "error");
      }
    } catch (error) {
      Swal.fire("Oops", "Something went wrong", "error");
      console.log(error);
    }
  }

  return (
    <div>
      <div className="row justify-content-center mt-5">
        <div className="col-md-5 mt-5">
          <div className="bs">
            <h2>Register Villagers</h2>
            <input
              type="text"
              className="form-control"
              placeholder="NIK"
              value={nik}
              onChange={(e) => {
                setNIK(e.target.value);
              }}
            />
            <input
              type="text"
              className="form-control"
              placeholder="Name"
              value={name}
              onChange={(e) => {
                setName(e.target.value);
              }}
            />
            <input
              type="text"
              className="form-control"
              placeholder="Email"
              value={email}
              onChange={(e) => {
                setEmail(e.target.value);
              }}
            />
            <input
              type="password"
              className="form-control"
              placeholder="Password"
              value={password}
              onChange={(e) => {
                setPassword(e.target.value);
              }}
            />

            <button className="btn btn-primary mt-3" onClick={register}>
              Register
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default RegisterUser;
