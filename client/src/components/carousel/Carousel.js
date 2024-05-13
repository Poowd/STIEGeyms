import React from "react";

export class Carousel extends React.Component {
  render() {
    return (
      <>
        <div
          id="carouselExampleAutoplaying"
          class="carousel slide rounded"
          data-bs-ride="carousel"
        >
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img
                src="https://miro.medium.com/v2/resize:fit:1200/1*xr6OGozIiVDxNc4-1eSg5A.png"
                class="d-block w-100 rounded"
                alt="..."
                style={{ height: "65vh", objectFit: "cover" }}
              />
            </div>
            <div class="carousel-item">
              <img
                src="https://i.redd.it/09ru73uiidb71.jpg"
                class="d-block w-100 rounded"
                alt="..."
                style={{ height: "65vh", objectFit: "cover" }}
              />
            </div>
            <div class="carousel-item">
              <img
                src="https://i.ytimg.com/vi_webp/ztNoBI0m_P0/maxresdefault.webp"
                class="d-block w-100 rounded"
                alt="..."
                style={{ height: "65vh", objectFit: "cover" }}
              />
            </div>
          </div>
          <button
            class="carousel-control-prev"
            type="button"
            data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button
            class="carousel-control-next"
            type="button"
            data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </>
    );
  }
}
