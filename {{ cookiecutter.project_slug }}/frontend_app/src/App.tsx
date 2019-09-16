import React from "react";
import {
  BrowserRouter as Router,
  Route,
  RouteComponentProps,
  Switch
} from "react-router-dom";
import logo from "./logo.svg";
import "./App.css";

const Home: React.FC = () => {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
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
};

const NoMatch: React.FC<RouteComponentProps> = ({ location }) => {
  return (
    <div>
      <h3>
        No match for <code>{location.pathname}</code>
      </h3>
    </div>
  );
};

const App: React.FC = () => {
  return (
    <Router>
      <Switch>
        <Route path="/" exact component={Home} />
        <Route component={NoMatch} />
      </Switch>
    </Router>
  );
};

export default App;
