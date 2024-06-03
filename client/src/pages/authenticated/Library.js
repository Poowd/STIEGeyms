import "../../App.css";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Navbar } from "../../components/navbar/Navbar";
import { Link, useParams } from "react-router-dom";
import { Carousel } from "../../components/carousel/Carousel";
import { Card } from "../../components/card/Card";
import { Tag } from "../../components/tag/Tag";
import { ModalCard } from "../../components/modal/ModalCard";

export function Library() {
  const params = useParams();
  const [placeholder, ssetPlaceholder] = useState([
    {
      image: "https://upload.wikimedia.org/wikipedia/en/1/1b/Outlast2.png",
      title: "Outlast 2",
      description: "This is a sample description for the games.",
    },
    {
      image:
        "https://m.media-amazon.com/images/M/MV5BNmNhM2NjMTgtNmIyZC00ZmVjLTk4YWItZmZjNGY2NThiNDhkXkEyXkFqcGdeQXVyODU4MDU1NjU@._V1_FMjpg_UX1000_.jpg",
      title: "Valorant",
      description: "This is a sample description for the games.",
    },
    {
      image:
        "https://images.g2a.com/360x600/1x1x1/terraria-steam-gift-global-i10000000238003/5ebbabf646177c06a555f152",
      title: "Terraria",
      description: "This is a sample description for the games.",
    },
    {
      image:
        "https://upload.wikimedia.org/wikipedia/en/5/51/Minecraft_cover.png",
      title: "Minecraft",
      description: "This is a sample description for the games.",
    },
    {
      image:
        "https://upload.wikimedia.org/wikipedia/en/b/b7/Dead_by_Daylight_Steam_header.jpg",
      title: "Dead by Daylight",
      description: "This is a sample description for the games.",
    },
    {
      image:
        "https://gamemusic.bn-ent.net/W4vE39ckQu/wp-content/uploads/2024/01/%E9%89%84%E6%8B%B38_%E9%85%8D%E4%BF%A1%E7%94%A8%E3%82%B8%E3%83%A3%E3%82%B1%E3%83%83%E3%83%88_KV1_01-scaled.jpg",
      title: "Tekken 8",
      description: "This is a sample description for the games.",
    },
  ]);
  const [library, setLibrary] = useState([]);
  const [selectedItem, setSelectedItem] = useState({
    image: "",
    title: "",
    rating: "",
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
    axios
      .post("http://localhost:8081/list-of-store-items", userdetails.UUID)
      .then((res) => {
        try {
          setLibrary(res.data);
        } catch (error) {
          console.log("something is lost");
        }
      });
  }, [library]);

  return (
    <>
      <main className="row m-0 p-0">
        <div className="d-flex gap-2 justify-content-end my-3">
          <input
            className="form-control w-25 bg-transparent text-light"
            type="text"
            placeholder="Search"
          />
          <div className="">
            <button className="btn btn-primary" data-bs-toggle="dropdown">
              &#9741;
            </button>
            <ul class="dropdown-menu bg-dark">
              <li>
                <a class="dropdown-item text-white" href="#">
                  Starred
                </a>
              </li>
              <li>
                <a class="dropdown-item text-white" href="#">
                  Most Played
                </a>
              </li>
              <li>
                <a class="dropdown-item text-white" href="#">
                  Least Played
                </a>
              </li>
              <li>
                <hr class="dropdown-divider" />
              </li>
              <li>
                <a class="dropdown-item text-white" href="#">
                  Reset Filter
                </a>
              </li>
            </ul>
          </div>
        </div>
        <section className="col-lg-2 p-0">
          <main
            className="p-3 rounded shadow-sm"
            style={{ backgroundColor: "#1e2125" }}
          >
            <h6>Games in Library</h6>
            <hr />
            <ul className="p-0 m-0">
              {placeholder.map((item, i) => (
                <li className="py-1">
                  <span>{item.title}</span>
                </li>
              ))}
            </ul>
          </main>
        </section>
        <section className="col-lg-10 p-0">
          <section className="px-3 p d-flex justify-content-start">
            <section
              className="rounded shadow-sm p-3 w-100"
              style={{ backgroundColor: "#1e2125" }}
            >
              <div class="row row-cols-1 row-cols-md-2 row-cols-lg-5 g-4">
                {library.map((item, i) => (
                  <div class="col">
                    <button
                      className="btn p-0"
                      type="button"
                      data-bs-toggle="modal"
                      data-bs-target="#gameitem"
                      onClick={() => {
                        setSelectedItem({
                          image:
                            "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png",
                          title: item.game_name,
                          rating: item.game_rating,
                        });
                      }}
                    >
                      <Card
                        imglink={
                          "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png"
                        }
                        gametitle={item.game_name}
                      />
                    </button>
                    <ModalCard
                      id={"gameitem"}
                      title={selectedItem.title}
                      content={
                        <main className="row m-0 p-0">
                          <section className="col-lg-5">
                            <main>
                              <img
                                src={selectedItem.image}
                                alt="..."
                                className="w-100"
                                style={{
                                  aspectRatio: "8/12",
                                  objectFit: "cover",
                                }}
                              ></img>
                            </main>
                          </section>
                          <section className="col-lg-7">
                            <main>
                              <header>
                                <h3>
                                  {selectedItem.title}{" "}
                                  <span class="badge text-bg-secondary rounded-pill">
                                    {selectedItem.rating}
                                  </span>
                                </h3>
                                <p className="m-0 p-0">Developer / Origin</p>
                                <hr />
                              </header>
                              <main className="d-flex gap-2">
                                <section className="d-flex gap-2">
                                  <Tag title={"Tag 1"} />
                                  <Tag title={"Tag 2"} />
                                  <Tag title={"+"} />|
                                </section>
                                <section>
                                  <small>
                                    <button className="btn btn-outline-warning btn-sm">
                                      Star
                                    </button>
                                  </small>
                                </section>
                              </main>
                              <main className="my-3">
                                <section>
                                  <p>{item.description}</p>
                                  <div className="bg-dark shadow-lg rounded p-3">
                                    <h6>User History</h6>
                                    <hr />
                                    <ul>
                                      <li>Hours Played: </li>
                                      <li>Times Opened: </li>
                                      <li>Rating: </li>
                                      <li>Date Acquired: </li>
                                    </ul>
                                  </div>
                                </section>
                              </main>
                            </main>
                          </section>
                        </main>
                      }
                    />
                  </div>
                ))}
              </div>
            </section>
          </section>
        </section>
      </main>
    </>
  );
}
