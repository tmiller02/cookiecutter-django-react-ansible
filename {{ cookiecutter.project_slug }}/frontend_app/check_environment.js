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