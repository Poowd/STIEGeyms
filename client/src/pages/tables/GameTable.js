import "../../App.css";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Navbar } from "../../components/navbar/Navbar";
import { Link, useParams } from "react-router-dom";
import { Carousel } from "../../components/carousel/Carousel";
import { Card } from "../../components/card/Card";
import { Modal } from "../../components/modal/Modal";
import { Tag } from "../../components/tag/Tag";
import { Table } from "../../components/table/Table";

export function GameTable() {
  const params = useParams();
  const [data, setData] = useState([]);
  const [games, setGames] = useState([]);
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

  useEffect(() => {
    axios.post("http://localhost:8081/list-of-games").then((res) => {
      try {
        setGames(res.data);
      } catch (error) {
        console.log("something is lost");
      }
    });
  }, [games]);

  return (
    <>
      <main className="bg-dark w-100 h-100 px-3">
        <div className="">
          <div className="h-100 overflow-y-auto">
            <div className="w-100 py-3 mb-3 d-flex justify-content-between">
              <h5>List of Games</h5>
              <button className="btn btn-sm btn-primary">add</button>
            </div>
            <Table
              th={
                <tr className="border-bottom border-dark-subtle">
                  <th>Game ID</th>
                  <th>Title</th>
                  <th>Developer</th>
                  <th>Publisher</th>
                  <th>Rating</th>
                  <th className="text-end">Action</th>
                </tr>
              }
              tb={games.map((entry, i) =>
                games.length > 0 ? (
                  <tr>
                    <td>{entry.game_id}</td>
                    <td>{entry.game_name}</td>
                    <td>{entry.game_developer}</td>
                    <td>{entry.game_publisher}</td>
                    <td>{entry.game_rating}</td>
                    <td className="d-flex gap-2 justify-content-end">
                      <button className="btn btn-sm btn-warning">edt</button>
                      <button className="btn btn-sm btn-danger">del</button>
                    </td>
                  </tr>
                ) : (
                  "No data shown"
                )
              )}
            />
          </div>
        </div>
      </main>
    </>
  );
}
