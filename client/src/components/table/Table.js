import React from "react";

export class Table extends React.Component {
  render() {
    return (
      <div className="border border-secondary-subtle p-3">
        <table class="w-100">
          <thead>{this.props.th}</thead>
          <tbody>{this.props.tb}</tbody>
        </table>
      </div>
    );
  }
}
