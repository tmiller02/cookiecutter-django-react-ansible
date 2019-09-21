# Frontend App

## Overview

The 'Frontend App' uses [Create React App](https://github.com/facebook/create-react-app)
with [TypeScript](https://www.typescriptlang.org) and [react-router](https://reacttraining.com/react-router/).

## Running the Dev Server

If you have `yarn` installed on you host machine, you can start the dev server
with the `start_dev_server.sh` script. This is a thin wrapper around
`yarn run start` and just sets some requirement environment variables:

```
$ cd frontend_app
$ ./start_dev_server.sh
```

You can then access the dev server at http://localhost:3000

If you don't have `yarn` installed on your host machine you can start the dev
server on the `controller` VM instead, although you may find this to be slower:

```
$ ./ssh_frontend.sh
[vagrant@controller frontend_app]$ ./start_dev_server.sh
```

You can then access the dev server at http://{{ cookiecutter.frontend_app_hostname }}:3000

## Formatting

To run the [prettier](https://prettier.io) formatter:

```
$ yarn run prettier
```

## Serving in Production

The production build of the frontend app is served with NGINX. All http
requests are redirected to https. The contents of `build/static/` are served as
regular files, with all other urls are redirected to `index.html` if a file with
a matching file is not found. We rely on `react-router` to handle matching/non
matching routes accordingly.
