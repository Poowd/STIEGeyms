import React from "react";
import { OffCanvas } from "./OffCanvas";

export class Navbar extends React.Component {
  render() {
    return (
      <>
        <nav class="navbar navbar-expand-lg rounded">
          <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">
              EGEYMS
            </a>
            <button
              class="btn"
              type="button"
              data-bs-toggle="offcanvas"
              data-bs-target="#offcanvasExample"
              aria-controls="offcanvasExample"
            >
              <span class="navbar-toggler-icon"></span>
            </button>
          </div>
        </nav>
        <OffCanvas />
      </>
    );
  }
}
