import "../../App.css";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Navbar } from "../../components/navbar/Navbar";
import { Link, useParams } from "react-router-dom";
import { Carousel } from "../../components/carousel/Carousel";
import { Card } from "../../components/card/Card";
import { Modal } from "../../components/modal/ModalCard";
import { Tag } from "../../components/tag/Tag";
import { Table } from "../../components/table/Table";
import { GoPlus } from "react-icons/go";
import { GoArchive } from "react-icons/go";
import { GoPencil } from "react-icons/go";

export function StoreItemTable() {
  const params = useParams();
  const [data, setData] = useState([]);
  const [items, setItem] = useState([]);
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
    axios.post("http://localhost:8081/list-of-store-items").then((res) => {
      try {
        setItem(res.data);
      } catch (error) {
        console.log("something is lost");
      }
    });
  }, [items]);

  return (
    <>
      <main className="bg-dark w-100 h-100 px-3">
        <div className="">
          <div className="h-100 overflow-y-auto">
            <div className="w-100 py-3 mb-3 d-flex justify-content-between">
              <h5>List of Store Items</h5>
              <button className="btn btn-sm btn-primary">
                <GoPlus />
              </button>
            </div>
            <Table
              th={
                <tr className="border-bottom border-dark-subtle">
                  <th>Item ID</th>
                  <th>Store</th>
                  <th>Game</th>
                  <th>Quantity</th>
                  <th>Price</th>
                  <th className="text-end">Action</th>
                </tr>
              }
              tb={items.map((entry, i) =>
                items.length > 0 ? (
                  <tr>
                    <td>{entry.item_id}</td>
                    <td>{entry.store_name}</td>
                    <td>{entry.game_name}</td>
                    <td>{entry.item_quantity}</td>
                    <td>{entry.item_price}</td>
                    <td className="d-flex gap-2 justify-content-end">
                      <button className="btn btn-sm btn-warning">
                        <GoArchive />
                      </button>
                      <button className="btn btn-sm btn-danger">
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
      </main>
    </>
  );
}
