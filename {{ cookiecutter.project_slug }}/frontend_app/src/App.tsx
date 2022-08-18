import React from "react";
import logo from "./logo.svg";
import "./App.css";

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Backend app API url:{" "}
          <a
            className="App-link"
            href={process.env.REACT_APP_BACKEND_URL}
            target="_blank"
            rel="noopener noreferrer"
          >
            {process.env.REACT_APP_BACKEND_URL}
          </a>
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
