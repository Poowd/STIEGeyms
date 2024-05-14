import React from "react";

export class Tag extends React.Component {
  render() {
    return (
      <small>
        <button className="btn btn-outline-info btn-sm">
          {this.props.title}
        </button>
      </small>
    );
  }
}
