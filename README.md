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
- Github URL `https://github.com/AmanyNabil/Udacity-Deployment-Project`

## Steps of Creation AWS Services

1.  Create AWS RDS for DB

    Update env Variable with DB Endpoint & port that created on AWS

2.  Create AWS EB application and environment for Backend project using terminal or AWS console

3.  Create S3 Bucket for Frontend Project

4.  Create CircleCI Account

5.  connct CircleCI with Github Account and the required project

## Pipeline Configration

- Add `bin\deploy.sh` file in both Backend and frontend Projects that has all depolyment commands.
- add Deploy script in `package.json` for both projects.
  ```json
  "deploy": "chmod +x bin/deploy.sh && bin/deploy.sh ",
  ```
- In Root folder `udagram` add `package.json` that has scripts to call backend and frontend scripts.

- Initialize Env Variables in circle CI.
- create `.circleci\config.yml` in the Root Folder
