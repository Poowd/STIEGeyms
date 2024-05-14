import "../../App.css";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Navbar } from "../../components/navbar/Navbar";
import { Link, useParams } from "react-router-dom";
import { Carousel } from "../../components/carousel/Carousel";
import { Card } from "../../components/card/Card";
import { Modal } from "../../components/modal/Modal";
import { Tag } from "../../components/tag/Tag";

export function Events() {
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
  const [selectedItem, setSelectedItem] = useState({
    image: "",
    title: "",
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

  return (
    <>
      <main className="bg-dark w-100 shadow-sm h-100 px-3 py-1">
        <section className="px-5">
          <section className="px-5">
            <div className="position-relative">
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
                          <h5>Game Masters</h5>
                          <p>Sub Description</p>
                        </div>
                      </div>
                    </header>
                    <main className="h-50 d-flex align-items-center">
                      <p className="p-0 m-0 fw-light fs-3 mb-5 pb-5 text-center w-100">
                        <span className="d-block">Hello @Everyone!</span>
                        <span className="fw-bold d-block fs-1">E-Cup 2024</span>
                        <span className="fw-semibold d-block fs-5 mb-3">
                          November 18, 2024 | Philippine MOA Arena
                        </span>
                        <span className="">
                          Everyone is invited for the upcoming Olympics for the
                          Gaming Community around Philippines.
                        </span>
                      </p>
                    </main>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </section>
      </main>
    </>
  );
}
