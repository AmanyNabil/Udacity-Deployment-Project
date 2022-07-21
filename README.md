# Udagram Project

## Description

This document focused on How to deploy the full stack project to a cloud service Provider (AWS) so that is available to users.

This application contains the main components of a 3-tier full stack application (UI, API, and Database).

## Instructions

- Add all dependence packages that needed for both backend and frontend project in `package.json`.
- Add all commands and scripts that needed to install, build and test in the Package.json for both backend and frontend project.
- we must run the App locally firstly to check if it's run successfly and solve any errors accures

## Installation

- use `npm install .` to install all packages.

## Access URLs

- S3 Bucket `http://udagram-ui-bucket.s3-website-us-east-1.amazonaws.com`
- EB `env-udagram-api.eba-e3ym2p22.us-east-1.elasticbeanstalk.com`
- RDS `database-1.cyr69zbm7l8i.us-east-1.rds.amazonaws.com`
- Github URL `https://github.com/AmanyNabil/Udacity-Deployment-Project`

## Steps of Creation AWS Services

1.  Create AWS RDS for DB

    Update env Variable with DB Endpoint & port that created on AWS

        ```
        POSTGRES_HOST=database-1.cyr69zbm7l8i.us-east-1.rds.amazonaws.com
        DB_PORT=5432
        POSTGRES_DB=postgres
        POSTGRES_USERNAME=postgres
        POSTGRES_PASSWORD=********

        ```

2.  Create AWS EB application and environment for Backend project using terminal or AWS console
    - create EB command using terminal
      ```bash
      eb init udagram-api --platform node.js --region us-east-1
      eb create env-udagram-api
      ```
    - update env variable `URL=env-udagram-api.eba-e3ym2p22.us-east-1.elasticbeanstalk.com`
    - update `udagram-frontend\src\environments\environment.ts` & `udagram-frontend\src\environments\environment.prod.ts` with eb app name and apiHost to connect frontend project with backend project
      ```ts
      appName: "udagram-api",
      apiHost:
      "env-udagram-api.eba-e3ym2p22.us-east-1.elasticbeanstalk.com/api/v0"
      ```
3.  Create S3 Bucket for Frontend Project

4.  Create CircleCI Account

5.  connct CircleCI with Github Account and the required project

6.

## Pipeline Configration

- Add `bin\deploy.sh` file in both Backend and frontend Projects that has all depolyment commands.
  - backend `deploy.sh` file
    ```
    eb init udagram-api --platform node.js --region us-east-1 &&
    eb use env-udagram-api &&
    eb deploy env-udagram-api &&
    eb setenv POSTGRES_HOST=$POSTGRES_HOST POSTGRES_USERNAME=$POSTGRES_USERNAME POSTGRES_PASSWORD=$POSTGRES_PASSWORD POSTGRES_DB=$POSTGRES_DB PORT=$PORT URL=$URL JWT_SECRET=$JWT_SECRET
    ```
  - frontend `deploy.sh` file
    ```
    aws s3 cp --recursive --acl public-read ./www s3://udagram-ui-bucket/ &&
    aws s3 cp --acl public-read --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./www/index.html s3://udagram-ui-bucket/
    ```
- add Deploy script in `package.json` for both projects.
  ```json
  "deploy": "chmod +x bin/deploy.sh && bin/deploy.sh ",
  ```
- In Root folder `udagram` add `package.json` that has scripts to call backend and frontend scripts.
  ```json
  "scripts": {
      "frontend:install": "cd udagram/udagram-frontend && npm install -f",
      "frontend:start": "cd udagram/udagram-frontend && npm run start",
      "frontend:build": "cd udagram/udagram-frontend && npm run build",
      "frontend:test": "cd udagram/udagram-frontend && npm run test",
      "frontend:e2e": "cd udagram/udagram-frontend && npm run e2e",
      "frontend:lint": "cd udagram/udagram-frontend && npm run lint",
      "frontend:deploy": "cd udagram/udagram-frontend && npm run deploy",
      "api:install": "cd udagram/udagram-api && npm install .",
      "api:build": "cd udagram/udagram-api && npm run build",
      "api:start": "cd udagram/udagram-api && npm run dev",
      "api:deploy": "cd udagram/udagram-api && npm run deploy"
  }
  ```
- Initialize Env Variables in circle CI.
- create `.circleci\config.yml` in the Root Folder

  ```yml
  version: 2.1
      orbs:
      # orgs contain basc recipes and reproducible actions (install node, aws, etc.)
      node: circleci/node@5.0.2
      eb: circleci/aws-elastic-beanstalk@2.0.1
      aws-cli: circleci/aws-cli@3.1.1

      # different jobs are calles later in the workflows sections
      jobs:
      build:
          docker:
          # the base image can run most needed actions with orbs
          - image: "cimg/node:14.15"
          steps:
          # install node and checkout code
          - node/install
          - eb/setup
          - aws-cli/setup
          - checkout

          # Use root level package.json to install dependencies in the frontend app
          - run:
              name: Install Front-End Dependencies
              command: |
                  echo "NODE --version"
                  echo $(node --version)
                  echo "NPM --version"
                  echo $(npm --version)
                  npm run frontend:install
          # TODO: Install dependencies in the the backend API
          - run:
              name: Install API Dependencies
              command: |
                  echo "TODO: Install dependencies in the the backend API  "
                  npm run api:install
          # xTODO: Lint the frontend
          - run:
              name: Front-End Lint
              command: |
                  echo "TODO: Lint the frontend "

          # TODO: Test the frontend
          - run:
              name: Front-End Test
              command: |
                  echo "TODO: Test the frontend "
              # npm run frontend:test
              TODO: E2E the frontend
          - run:
              name: Front-End E2E
              command: |
                  echo "TODO: E2E the frontend "
              #  npm run frontend:e2e

          # TODO: Build the frontend app
          - run:
              name: Front-End Build
              command: |
                  echo "TODO: Build the frontend app"
                  npm run frontend:build
          # TODO: Build the backend API
          - run:
              name: API Build
              command: |
                  echo "TODO: Build the backend API"
                  npm run api:build
          - run:
              name: Back-End Deploy
              # TODO: Install, build, deploy Back-End
              command: |
                  echo "# TODO: Install, build, deployBack-End"
                  npm run api:deploy

          - run:
              name: Front-End Deploy
              # TODO: Install, build, deploy Front-End
              command: |
                  echo "# TODO: Install, build, deploy Front-End"
                  npm run frontend:deploy
      workflows:
      basic-workflow:
          jobs:
          - build:
              filters:
                  branches:
                  only: main

  ```
