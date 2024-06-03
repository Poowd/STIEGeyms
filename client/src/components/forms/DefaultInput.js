import React from "react";

export class DefaultInput extends React.Component {
  render() {
    return (
      <div className="row mb-3">
        <label className="col-sm-3 col-form-label">{this.props.label}</label>
        <div className="col-sm-9">
          <input
            id={this.props.name}
            name={this.props.name}
            type={this.props.type}
            placeholder={this.props.placeholder}
            className="form-control"
            onChange={this.props.onchange}
            value={this.props.value}
          ></input>
        </div>
      </div>
    );
  }
}
