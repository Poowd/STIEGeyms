import "../../App.css";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Navbar } from "../../components/navbar/Navbar";
import { Link, useParams } from "react-router-dom";
import { Carousel } from "../../components/carousel/Carousel";
import { Card } from "../../components/card/Card";
import { Modal } from "../../components/modal/ModalCard";
import { Tag } from "../../components/tag/Tag";
import { GameTable } from "../tables/GameTable";
import { StoreTable } from "../tables/StoreTable";
import { StoreItemTable } from "../tables/StoreItemTable";
import { TournamentTable } from "../tables/TournamentTable";

export function AdminView() {
  const params = useParams();
  const [c_table, setCurrentTable] = useState("games");
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
        <div className="position-relative">
          <div className="rounded" style={{ height: "83vh" }}>
            <main className="row h-100 m-0">
              <section className="col-lg-1">
                <div className="d-grid gap-2">
                  <button
                    className={
                      c_table === "games"
                        ? "btn btn-primary fw-bold"
                        : "btn btn-info"
                    }
                    onClick={() => setCurrentTable("games")}
                  >
                    Games
                  </button>
                  <button
                    className={
                      c_table === "stores"
                        ? "btn btn-primary fw-bold"
                        : "btn btn-info"
                    }
                    onClick={() => setCurrentTable("stores")}
                  >
                    Store
                  </button>
                  <button
                    className={
                      c_table === "store-items"
                        ? "btn btn-primary fw-bold"
                        : "btn btn-info"
                    }
                    onClick={() => setCurrentTable("store-items")}
                  >
                    Store Items
                  </button>
                  <button
                    className={
                      c_table === "tournament"
                        ? "btn btn-primary fw-bold"
                        : "btn btn-info"
                    }
                    onClick={() => setCurrentTable("tournament")}
                  >
                    Tournament
                  </button>
                </div>
              </section>
              <section className="col-lg-11">
                {c_table === "games" ? <GameTable /> : ""}
                {c_table === "stores" ? <StoreTable /> : ""}
                {c_table === "store-items" ? <StoreItemTable /> : ""}
                {c_table === "tournament" ? <TournamentTable /> : ""}
              </section>
            </main>
          </div>
        </div>
      </main>
    </>
  );
}
