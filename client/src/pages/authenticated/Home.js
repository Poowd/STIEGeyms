import "../../App.css";
import axios from "axios";
import React, { useState } from "react";
import { Navbar } from "../../components/navbar/Navbar";

export function Home() {
  return (
    <>
      <main
        className="w-100 d-flex justify-content-center align-items-center p-3"
        style={{ height: "100vh" }}
      >
        <main className="h-100 w-100 bg-light rounded shadow-sm p-3">
          <header>
            <Navbar />
          </header>
        </main>
      </main>
    </>
  );
}
