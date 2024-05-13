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
          <Link to={"/dash"}>
            <button className="btn w-100 py-3 text-start fs-5 text-white">
              Dash
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
