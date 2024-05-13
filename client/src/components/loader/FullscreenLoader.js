import React from "react";
import "./Loader.css";

export class FullscreenLoader extends React.Component {
  render() {
    return (
      <main
        className="d-flex justify-content-center align-items-center bg-dark flex-column"
        style={{ width: "100%", height: "100vh" }}
      >
        <div className="loader"></div>
        <div>
          <h1>
            <span className="fade1 text-white">E-</span>
            <span className="fade2 text-primary fw-bold">GEYMS</span>
          </h1>
        </div>
      </main>
    );
  }
}
