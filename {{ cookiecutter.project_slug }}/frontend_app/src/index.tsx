import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import App from "./App";

const requiredEnvironmentVariables = [
  "REACT_APP_BACKEND_URL",
];

const unsetEnvironmentVariables = requiredEnvironmentVariables.filter(
  (environmentVariable) => { return !(environmentVariable in process.env) }
);

if (unsetEnvironmentVariables.length > 0) {
  throw new Error(
    `The following required environment variables are not set: ${unsetEnvironmentVariables.join(
      ", "
    )}`
  );
}

ReactDOM.render(<App />, document.getElementById("root"));
