import React from "react";
import axios from "axios";
import { Link } from "react-router-dom";

export class OffCanvas extends React.Component {
  render() {
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
      <div
        class="offcanvas offcanvas-start rounded m-3 bg-dark text-white"
        tabindex="-1"
        id="offcanvasExample"
        aria-labelledby="offcanvasExampleLabel"
      >
        <div class="offcanvas-header d-flex justify-content-between">
          <h5 class="offcanvas-title" id="offcanvasExampleLabel">
            Tab Selection
          </h5>
          <button
            type="button"
            class="text-white btn"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
          >
            &times;
          </button>
        </div>
        <div class="offcanvas-body">
          <Link to={"/home"}>
            <button
              className="btn w-100 py-2 text-start fs-5 text-white"
              data-bs-dismiss="offcanvas"
            >
              Home
            </button>
          </Link>
          <Link to={"/library"}>
            <button
              className="btn w-100 py-2 text-start fs-5 text-white"
              data-bs-dismiss="offcanvas"
            >
              Library
            </button>
          </Link>
          <Link to={"/store"}>
            <button
              className="btn w-100 py-2 text-start fs-5 text-white"
              data-bs-dismiss="offcanvas"
            >
              Store
            </button>
          </Link>
          <Link to={"/community"}>
            <button
              className="btn w-100 py-2 text-start fs-5 text-white"
              data-bs-dismiss="offcanvas"
            >
              Community
            </button>
          </Link>
          <Link to={"/events"}>
            <button
              className="btn w-100 py-2 text-start fs-5 text-white"
              data-bs-dismiss="offcanvas"
            >
              Events
            </button>
          </Link>
          <Link to={"/profile"}>
            <button
              className="btn w-100 py-2 text-start fs-5 text-white"
              data-bs-dismiss="offcanvas"
            >
              Profile
            </button>
          </Link>
          <Link to={"/"}>
            <button
              className="btn w-100 py-2 text-start fs-5 btn-danger"
              onClick={handleLogout}
            >
              Logout
            </button>
          </Link>
        </div>
      </div>
    );
  }
}
