import axios from "axios";
import { useEffect, useState } from "react";

const useEditHook = (target, data) => {
  axios
    .post(target, data)
    .then((res) => {
      try {
      } catch (err) {
        console.log(err);
      }
    })
    .catch((err) => console.log(err));
};

export default useEditHook;
