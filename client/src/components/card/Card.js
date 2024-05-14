import React from "react";

export class Card extends React.Component {
  render() {
    return (
      <div
        className="card w-100"
        style={{
          height: "25em",
          aspectRatio: "8/12",
          backgroundImage: "url('" + this.props.imglink + "')",
          backgroundSize: "cover",
          backgroundPosition: "center",
        }}
      >
        <div className="card-body">
          <div className="h-100 d-flex flex-column justify-content-end">
            <h5 className="card-title">{this.props.gametitle}</h5>
          </div>
        </div>
      </div>
    );
  }
}
