import "../../App.css";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Navbar } from "../../components/navbar/Navbar";
import { Link, useParams } from "react-router-dom";
import { Carousel } from "../../components/carousel/Carousel";
import { Card } from "../../components/card/Card";
import { Modal } from "../../components/modal/ModalCard";
import { Tag } from "../../components/tag/Tag";

export function Community() {
  const params = useParams();

  const [userdetails, setUserDetails] = useState({
    Auth: false,
    UUID: "",
    USERNAME: "",
    USER_TYPE: "",
    AUTH: "",
    Message: "",
  });

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

  return (
    <>
      <main className="bg-dark w-100 shadow-sm h-100 px-3 py-1">
        <section className="px-5">
          <section className="px-5">
            <div className="position-relative">
              <div className="px-5">
                <div className="px-5">
                  <div className="px-5">
                    <div className="px-5">
                      <div className="px-2 d-flex gap-3">
                        <input className="form-control bg-transparent"></input>
                        <button className="btn btn-primary">New</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div className="px-3 rounded" style={{ height: "80vh" }}>
                <div className="w-100 h-100 d-flex justify-content-center align-items-center">
                  <div className="w-75 h-75 py-3 px-5 rounded shadow-lg">
                    <header className="h-25 d-flex align-items-center">
                      <div className="d-flex gap-3">
                        <div
                          className="bg-info rounded-circle"
                          style={{ width: "4em", height: "4em" }}
                        ></div>
                        <div>
                          <h5>Username</h5>
                          <p>Sub Description</p>
                        </div>
                      </div>
                    </header>
                    <main className="h-50 d-flex align-items-center">
                      <p className="p-0 m-0 fw-light fs-3 mb-5 pb-5">
                        <span className="d-block">Hello @Everyone!</span>
                        <span>
                          I am pleased to announced that I am officially part of
                          E-Geyms Community.
                        </span>
                      </p>
                    </main>
                    <footer className="h-25 d-flex align-items-center">
                      <div className="d-flex gap-2">
                        <button className="btn btn-info">Interested</button>
                        <button className="btn btn-info">Share</button>|
                        <button className="btn btn-outline-warning">
                          Star
                        </button>
                      </div>
                    </footer>
                  </div>
                </div>
              </div>
              <div className="position-absolute top-50 w-100 rounded px-3">
                <div className="d-flex justify-content-between">
                  <button className="btn btn-outline-info rounded-circle px-4 py-3">
                    &#8678;
                  </button>
                  <button className="btn btn-outline-info rounded-circle px-4 py-3">
                    &#8680;
                  </button>
                </div>
              </div>
            </div>
          </section>
        </section>
      </main>
    </>
  );
}
