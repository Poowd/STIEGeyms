import React from "react";

export class ModalCard extends React.Component {
  render() {
    return (
      <div
        class="modal fade"
        id={this.props.id}
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content bg-dark">
            <div class="modal-body">
              <header className="d-flex justify-content-between">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">
                  {this.props.title}
                </h1>
                <button
                  type="button"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"
                ></button>
              </header>
              <main className="my-3">{this.props.content}</main>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
