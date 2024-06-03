import React from "react";

export class DefaultSelect extends React.Component {
  render() {
    return (
      <div className="row mb-3">
        <label className="col-sm-3 col-form-label">{this.props.label}</label>
        <div className="col-sm-9">
          <select
            className={"d-block w-100 px-4 py-2 form-select m-0 "}
            id={this.props.id}
            name={this.props.id}
            onChange={this.props.onchange}
            required={this.props.required}
            disabled={this.props.disabled}
          >
            <option defaultValue={this.props.defaultvalue}>
              {this.props.defaultcontent}
            </option>
            {this.props.options}
          </select>
        </div>
      </div>
    );
  }
}
