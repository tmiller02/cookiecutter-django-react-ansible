import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import App from "./App";
import reportWebVitals from "./reportWebVitals";

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

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById("root")
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
