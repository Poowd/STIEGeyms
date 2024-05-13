import React from "react";
import { OffCanvas } from "./OffCanvas";

export class Navbar extends React.Component {
  render() {
    return (
      <>
        <nav class="navbar navbar-expand-lg rounded">
          <div class="container-fluid">
            <a class="navbar-brand fw-bold text-info" href="#">
              EGEYMS
            </a>
            <button
              class="btn text-white"
              type="button"
              data-bs-toggle="offcanvas"
              data-bs-target="#offcanvasExample"
              aria-controls="offcanvasExample"
            >
              <span class="navbar-toggler-icon">&#9776;</span>
            </button>
          </div>
        </nav>
        <OffCanvas />
      </>
    );
  }
}
