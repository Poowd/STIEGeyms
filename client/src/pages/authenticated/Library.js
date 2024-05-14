import "../../App.css";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Navbar } from "../../components/navbar/Navbar";
import { Link, useParams } from "react-router-dom";
import { Carousel } from "../../components/carousel/Carousel";
import { Card } from "../../components/card/Card";

export function Library() {
  const params = useParams();
  const [placeholder, ssetPlaceholder] = useState([
    {
      image: "https://upload.wikimedia.org/wikipedia/en/1/1b/Outlast2.png",
      title: "Outlast 2",
    },
    {
      image:
        "https://m.media-amazon.com/images/M/MV5BNmNhM2NjMTgtNmIyZC00ZmVjLTk4YWItZmZjNGY2NThiNDhkXkEyXkFqcGdeQXVyODU4MDU1NjU@._V1_FMjpg_UX1000_.jpg",
      title: "Valorant",
    },
    {
      image:
        "https://images.g2a.com/360x600/1x1x1/terraria-steam-gift-global-i10000000238003/5ebbabf646177c06a555f152",
      title: "Terraria",
    },
    {
      image:
        "https://upload.wikimedia.org/wikipedia/en/5/51/Minecraft_cover.png",
      title: "Minecraft",
    },
    {
      image:
        "https://upload.wikimedia.org/wikipedia/en/b/b7/Dead_by_Daylight_Steam_header.jpg",
      title: "Dead by Daylight",
    },
    {
      image:
        "https://gamemusic.bn-ent.net/W4vE39ckQu/wp-content/uploads/2024/01/%E9%89%84%E6%8B%B38_%E9%85%8D%E4%BF%A1%E7%94%A8%E3%82%B8%E3%83%A3%E3%82%B1%E3%83%83%E3%83%88_KV1_01-scaled.jpg",
      title: "Tekken 8",
    },
  ]);
  const [currentpage, setCurrentPage] = useState(params.page);
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
      <main className="row m-0 p-0">
        <div className="d-flex gap-2 justify-content-end my-3">
          <input
            className="form-control w-25 bg-transparent text-light"
            type="text"
            placeholder="Search"
          />
          <button className="btn btn-primary">&#9741;</button>
        </div>
        <section className="col-lg-2 p-0">
          <main
            className="p-3 rounded shadow-sm"
            style={{ backgroundColor: "#1e2125" }}
          >
            <h6>Games in Library</h6>
            <hr />
            <ul>
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
                {placeholder.map((item, i) => (
                  <div class="col">
                    <button className="btn p-0">
                      <Card imglink={item.image} gametitle={item.title} />
                    </button>
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
