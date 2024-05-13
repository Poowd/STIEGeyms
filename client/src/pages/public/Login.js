import "../../App.css";
import axios from "axios";
import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";

import logo from "../../assets/icon/gamer.png";

export function Login() {
  const navigate = useNavigate();
  const [values, setValues] = useState({
    email: "",
    password: "",
  });

  //get the data from server, if the server response if success -- login
  axios.defaults.withCredentials = true;
  const handleSubmit = (e) => {
    e.preventDefault(); //prevents normal function of onsubmit in forms
    axios
      .post("http://localhost:8081/login", values) //stores in usestate values
      .then((res) => {
        if (res.data.Status === "Success") {
          navigate("/"); //to dashboard
          window.location.reload(true);
        } else {
          alert(res.data.Message);
        }
      })
      .catch((err) => console.log(err));
  };

  return (
    <>
      <main
        className="w-100 d-flex justify-content-center align-items-center p-5"
        style={{ height: "100vh" }}
      >
        <section
          className="h-100 w-100 bg-white rounded shadow-sm p-3"
          style={{
            backgroundImage:
              "url('https://img.freepik.com/premium-photo/cartoon-fantasy-illustration-purple-galaxy-sky-with-moon-ground-surface-with-rocks-purple-galaxy-background-with-craters-lit-cracks_76964-151761.jpg?size=626&ext=jpg&ga=GA1.1.1369675164.1715472000&semt=ais_user')",
            backgroundSize: "cover",
          }}
        >
          <main className="row m-0 h-100">
            <section className="col-lg-7"></section>
            <section
              className="col-lg-5 h-100 d-flex flex-column justify-content-center rounded shadow-sm"
              style={{
                backgroundColor: "#00000075",
                backdropFilter: "blur(10px)",
              }}
            >
              <main className="p-5">
                <form onSubmit={handleSubmit}>
                  <div className="px-lg-5 d-flex flex-column justify-content-center">
                    <div className="d-flex justify-content-center">
                      <img
                        src={logo}
                        alt="..."
                        className="w-25 ratio ratio-1x1"
                      ></img>
                    </div>
                    <h1 className="px-lg-5 fw-bold text-white text-center mb-5">
                      WELCOME
                    </h1>
                    <div className="px-lg-5">
                      <div className="my-2 d-flex flex-column gap-2 text-white">
                        <label>Username</label>
                        <input
                          className="form-control py-3 px-4 bg-transparent text-white"
                          type="text"
                          name="Email"
                          id="Email"
                          placeholder="Username"
                          onChange={(e) =>
                            setValues({ ...values, email: e.target.value })
                          }
                          required
                        ></input>
                        <label>Password</label>
                        <input
                          className="form-control py-3 px-4 bg-transparent text-white"
                          type="password"
                          name="Password"
                          id="Password"
                          placeholder="Password"
                          onChange={(e) =>
                            setValues({ ...values, password: e.target.value })
                          }
                          required
                        ></input>
                        <p className="text-end my-0">
                          <Link to={"/"} className="text-secondary">
                            Forgot Password?
                          </Link>
                        </p>
                      </div>
                      <button
                        className="btn btn-primary w-100 rounded-pill py-2 mt-3"
                        type="submit"
                      >
                        <p className="fs-5 m-0">LOGIN</p>
                      </button>
                    </div>
                  </div>
                </form>
              </main>
            </section>
          </main>
        </section>
      </main>
    </>
  );
}
