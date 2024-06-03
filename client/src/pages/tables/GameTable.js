import "../../App.css";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Navbar } from "../../components/navbar/Navbar";
import { Link, useParams } from "react-router-dom";
import { Carousel } from "../../components/carousel/Carousel";
import { Card } from "../../components/card/Card";
import { Tag } from "../../components/tag/Tag";
import { Table } from "../../components/table/Table";
import { GoPlus } from "react-icons/go";
import { GoArchive } from "react-icons/go";
import { GoPencil } from "react-icons/go";
import { ModalCard } from "../../components/modal/ModalCard";
import { DefaultInput } from "../../components/forms/DefaultInput";
import { DefaultSelect } from "../../components/forms/DefaultSelect";
import useCreateHook from "../../hooks/CreateHook";

export function GameTable() {
  const bootstrap = require("bootstrap");
  const params = useParams();
  const [games, setGames] = useState([]);
  const [modalcontent, setModalContent] = useState({
    Title: "",
    SubTitle: "",
  });

  const [randomcode, setRandomCode] = useState([]);
  const [gameForm, setGameForm] = useState({
    name: "",
    developer: "",
    publisher: "",
    description: "",
  });

  const [selgameForm, setSelGameForm] = useState({
    id: "",
    name: "",
    developer: "",
    publisher: "",
    description: "",
  });

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

  useEffect(() => {
    axios.get("http://localhost:8081/random-code-generator").then((res) => {
      try {
        setRandomCode(res.data);
      } catch (error) {
        console.log("something is lost");
      }
    });
  }, [games.length]);

  const HandleForm = (e) => {
    setGameForm((prev) => ({
      ...prev,
      [e.target.name]: e.target.value,
    }));
  };
  const HandleEForm = (e) => {
    setSelGameForm((prev) => ({
      ...prev,
      [e.target.name]: e.target.value,
    }));
  };

  let Modal = null;
  function getModal() {
    if (!Modal) {
      Modal = new bootstrap.Modal(document.getElementById("Modal"));
    }
    return Modal;
  }
  const Create = (e) => {
    e.preventDefault();
    useCreateHook("http://localhost:8081/insert-game", {
      name: gameForm.name,
      developer: gameForm.developer,
      publisher: gameForm.publisher,
      description: gameForm.description,
    });
    setGameForm({
      name: "",
      developer: "",
      publisher: "",
      description: "",
    });
  };
  const Edit = (e) => {
    e.preventDefault();
    useCreateHook("http://localhost:8081/edit-game", {
      id: selgameForm.id,
      name: selgameForm.name,
      developer: selgameForm.developer,
      publisher: selgameForm.publisher,
      description: selgameForm.description,
    });
    setSelGameForm({
      id: "",
      name: "",
      developer: "",
      publisher: "",
      description: "",
    });
  };
  const Archive = (e) => {
    e.preventDefault();
    useCreateHook("http://localhost:8081/archive-game", {
      id: selgameForm.id,
      name: selgameForm.name,
      developer: selgameForm.developer,
      publisher: selgameForm.publisher,
      description: selgameForm.description,
    });
    setSelGameForm({
      id: "",
      name: "",
      developer: "",
      publisher: "",
      description: "",
      code: "",
    });
  };

  return (
    <>
      <main className="bg-dark w-100 h-100 px-3">
        <div className="">
          <div className="h-100 overflow-y-auto">
            <div className="w-100 py-3 mb-3 d-flex justify-content-between">
              <h5>List of Games</h5>
              <button className="btn btn-sm btn-primary" onClick={() => {}}>
                <GoPlus />
              </button>
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
                  <tr key={i}>
                    <td>{entry.game_id}</td>
                    <td>{entry.game_name}</td>
                    <td>{entry.game_developer}</td>
                    <td>{entry.game_publisher}</td>
                    <td>{entry.game_description}</td>
                    <td>{entry.game_rating}</td>
                    <td className="d-flex gap-2 justify-content-end">
                      <button
                        className="btn btn-sm btn-warning"
                        onClick={() =>
                          setSelGameForm({
                            id: entry.game_id,
                            name: entry.game_name,
                            developer: entry.game_developer,
                            publisher: entry.game_publisher,
                            description: entry.game_description,
                          })
                        }
                      >
                        <GoArchive />
                      </button>
                      <button
                        className="btn btn-sm btn-danger"
                        onClick={() =>
                          setSelGameForm({
                            id: entry.game_id,
                            name: entry.game_name,
                            developer: entry.game_developer,
                            publisher: entry.game_publisher,
                            description: entry.game_description,
                          })
                        }
                      >
                        <GoPencil />
                      </button>
                    </td>
                  </tr>
                ) : (
                  "No data shown"
                )
              )}
            />
          </div>
        </div>
        <form className="p-3 shadow-sm" onSubmit={Create}>
          <div className="row mb-3">
            <h3>Create a Game Form</h3>
            <p className="fs-6 fst-italic text-secondary">Temporary, No time</p>
          </div>
          <DefaultInput
            name={"name"}
            label={"game_name"}
            type={"text"}
            placeholder={"game_name"}
            value={gameForm.name}
            onchange={HandleForm}
          />
          <DefaultInput
            name={"developer"}
            label={"game_developer"}
            type={"text"}
            placeholder={"game_developer"}
            value={gameForm.developer}
            onchange={HandleForm}
          />
          <DefaultInput
            name={"publisher"}
            label={"game_publisher"}
            type={"text"}
            placeholder={"game_publisher"}
            value={gameForm.publisher}
            onchange={HandleForm}
          />
          <DefaultInput
            name={"description"}
            label={"game_description"}
            type={"text"}
            placeholder={"game_description"}
            value={gameForm.description}
            onchange={HandleForm}
          />
          <div className="row mb-3">
            <div className="offset-sm-3 col-sm-3 d-grid">
              <button type="submit" className="btn btn-primary">
                Submit
              </button>
            </div>
          </div>
        </form>
        <form className="p-3 shadow-sm" onSubmit={Edit}>
          <div className="row mb-3">
            <h3>Edit a Game Form</h3>
            <p className="fs-6 fst-italic text-secondary">Temporary, No time</p>
          </div>
          <DefaultInput name={"id"} type={"hidden"} value={selgameForm.id} />
          <DefaultInput
            name={"name"}
            label={"game_name"}
            type={"text"}
            placeholder={"game_name"}
            value={selgameForm.name}
            onchange={HandleEForm}
          />
          <DefaultInput
            name={"developer"}
            label={"game_developer"}
            type={"text"}
            placeholder={"game_developer"}
            value={selgameForm.developer}
            onchange={HandleEForm}
          />
          <DefaultInput
            name={"publisher"}
            label={"game_publisher"}
            type={"text"}
            placeholder={"game_publisher"}
            value={selgameForm.publisher}
            onchange={HandleEForm}
          />
          <DefaultInput
            name={"description"}
            label={"game_description"}
            type={"text"}
            placeholder={"game_description"}
            value={selgameForm.description}
            onchange={HandleEForm}
          />
          <div className="row mb-3">
            <div className="offset-sm-3 col-sm-3 d-grid">
              <button type="submit" className="btn btn-primary">
                Submit
              </button>
            </div>
          </div>
        </form>
        <form className="p-3 shadow-sm" onSubmit={Archive}>
          <div className="row mb-3">
            <h3>Delete a Game Form</h3>
            <p className="fs-6 fst-italic text-secondary">Temporary, No time</p>
          </div>

          <h5>You sure, you want to delete {selgameForm.name} ?</h5>
          <DefaultInput name={"id"} type={"hidden"} value={selgameForm.id} />
          <DefaultInput
            name={"code"}
            label={randomcode}
            type={"text"}
            placeholder={"code"}
            value={selgameForm.code}
            onchange={HandleEForm}
          />
          <div className="row mb-3">
            <div className="offset-sm-3 col-sm-3 d-grid">
              <button
                type="submit"
                className="btn btn-primary"
                disabled={
                  randomcode === selgameForm.code && selgameForm.id.length > 0
                    ? false
                    : true
                }
              >
                Submit
              </button>
            </div>
          </div>
        </form>
      </main>
      <ModalCard
        id={"Modal"}
        title={modalcontent.Title}
        content={modalcontent.Content}
      />
    </>
  );
}
