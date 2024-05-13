import "../../App.css";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Navbar } from "../../components/navbar/Navbar";
import { Link, useParams } from "react-router-dom";
import { Carousel } from "../../components/carousel/Carousel";

export function Home() {
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
      <main
        className="w-100 d-flex justify-content-center align-items-center p-3"
        style={{ height: "100vh" }}
      >
        <main className="h-100 w-100 bg-dark rounded shadow-sm p-3 overflow-y-auto text-white">
          <header>
            <Navbar />
          </header>
          <main className="px-3 py-2">
            {params.page === "home" ? (
              <main>
                <header className="row m-0">
                  <main className="col-lg-8 mt-0 mx-0 mb-2">
                    <div
                      className="rounded p-3 shadow-md"
                      style={{ backgroundColor: "#1e2125" }}
                    >
                      <Carousel />
                    </div>
                  </main>
                  <main className="col-lg-4 mt-0 mx-0 mb-2">
                    <div
                      className="rounded p-2 shadow-md mb-2"
                      style={{ backgroundColor: "#1e2125" }}
                    >
                      <img
                        src="https://assets-prd.ignimgs.com/2024/01/22/tekken8-review-blogroll-1705944513847.jpg"
                        alt="..."
                        className="w-100"
                        style={{
                          height: "32vh",
                          objectFit: "cover",
                        }}
                      ></img>
                    </div>
                    <div
                      className="rounded p-2 shadow-md"
                      style={{ backgroundColor: "#1e2125" }}
                    >
                      <img
                        src="https://images.pushsquare.com/8ef261a56aedd/marvels-spider-man-2-ps5-playstation-5-1.large.jpg"
                        alt="..."
                        className="w-100"
                        style={{
                          height: "32vh",
                          objectFit: "cover",
                        }}
                      ></img>
                    </div>
                  </main>
                  <hr className="my-3" />
                </header>
                <main>
                  <h3 className="display-6 text-center mb-3">
                    Welcome{" "}
                    <span className="text-info">{userdetails.USERNAME}</span>,
                  </h3>
                  <div className="d-flex gap-4 justify-content-center">
                    <Link to={"/library"}>
                      <button className="btn btn-outline-info">
                        <h3>Library</h3>
                      </button>
                    </Link>
                    <Link to={"/store"}>
                      <button className="btn btn-outline-info">
                        <h3>Store</h3>
                      </button>
                    </Link>
                    <Link to={"/community"}>
                      <button className="btn btn-outline-info">
                        <h3>Community</h3>
                      </button>
                    </Link>
                    <Link to={"/events"}>
                      <button className="btn btn-outline-info">
                        <h3>Events</h3>
                      </button>
                    </Link>
                  </div>
                </main>
              </main>
            ) : (
              ""
            )}
            {params.page === "featured" ? "featured" : ""}
            {params.page === "library" ? "library" : ""}
            {params.page === "store" ? "store" : ""}
            {params.page === "community" ? "community" : ""}
            {params.page === "events" ? "events" : ""}
            {params.page === "profile" ? "profile" : ""}
          </main>
        </main>
      </main>
    </>
  );
}
