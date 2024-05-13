//Resources
import "./App.css";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Routes, Route, Link, Navigate, useNavigate } from "react-router-dom";
import { Login } from "./pages/public/Login";
import { FullscreenLoader } from "./components/loader/FullscreenLoader";
import { Home } from "./pages/authenticated/Home";

function App() {
  const navigate = useNavigate();
  //Initialize States / Variables
  const [userdetails, setUserDetails] = useState({
    Auth: false,
    UUID: "",
    USERNAME: "",
    USER_TYPE: "",
    AUTH: "",
    Message: "",
  });

  const [isLoading, setIsLoading] = useState(true);
  useEffect(() => {
    // Simulate an API call
    setTimeout(() => {
      setIsLoading(false);
    }, 2000);
  }, []);

  //Get Authentication from the Server
  useEffect(() => {
    axios.get("http://localhost:8081").then((res) => {
      if (res.data.Status === "Success") {
        setUserDetails({
          Auth: true,
          UUID: res.data.UUID,
          USERNAME: res.data.USERNAME,
          USER_TYPE: res.data.USER_TYPE,
          AUTH: res.data.AUTH,
          Message: res.data.Message,
        });
      } else {
        setUserDetails({
          Auth: false,
          UUID: "",
          UUID: "",
          USERNAME: "",
          USER_TYPE: "",
          AUTH: "",
          Message: "",
        });
      }
    });
  }, [userdetails.Message]);

  //Remove your Token / Cookies -- Logging Out an Account
  const handleLogout = () => {
    axios
      .post("http://localhost:8081/logout")
      .then((res) => {
        if (res.data.Status === "Success") {
          window.location.reload(true);
        } else {
          alert("Error");
        }
      })
      .catch((err) => console.log(err));
  };

  //Darkers Color
  //#171a1d
  //Default
  //bg-dark
  //Supa high level dark
  //#111315

  return (
    <main className="" style={{ backgroundColor: "#171a1d" }}>
      <header>{isLoading ? <FullscreenLoader /> : ""}</header>
      <main>
        {userdetails.Auth ? (
          <Routes>
            {userdetails.USER_TYPE === "Admin" ? (
              <>
                <Route path="/:page" element={<Home />}></Route>
              </>
            ) : userdetails.USER_TYPE === "Student" ? (
              <>
                <Route path="/" element={"dasdadsa"}></Route>
              </>
            ) : (
              ""
            )}

            <Route path="/*" element={""} />
          </Routes>
        ) : (
          <Login />
        )}
      </main>
    </main>
  );
}

export default App;
