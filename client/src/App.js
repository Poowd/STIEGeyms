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
    Name: "",
    Message: "",
    UserType: "",
    File_Maintainance: "",
    Access_icon: "",
    Access_Edit: "",
    Access_Insert: "",
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
          Name: res.data.Name,
          Message: res.data.Message,
          UserType: res.data.UserType,
          File_Maintainance: res.data.File_Maintainance,
          Access_View: res.data.Access_View,
          Access_Edit: res.data.Access_Edit,
          Access_Insert: res.data.Access_Insert,
        });
      } else {
        setUserDetails({
          Auth: false,
          UUID: "",
          Name: "",
          Message: "",
          UserType: "",
          File_Maintainance: "False",
          Access_View: "False",
          Access_Edit: "False",
          Access_Insert: "False",
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

  return (
    <main className="bg-dark">
      <header>{isLoading ? <FullscreenLoader /> : ""}</header>
      <main>
        {userdetails.Auth ? (
          <Routes>
            {userdetails.UserType === "Admin" ? (
              <>
                <Route path="/" element={<Home />}></Route>
                <Route path="/dash" element={"Hello"}></Route>
              </>
            ) : userdetails.UserType === "Student" ? (
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
