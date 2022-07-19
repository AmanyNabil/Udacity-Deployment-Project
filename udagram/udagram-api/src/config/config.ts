import * as dotenv from "dotenv";
dotenv.config();

// ENV variables
// - AWS_ACCESS_KEY_ID
// - AWS_SECRET_ACCESS_KEY
// Are Also needed

export const config = {
  host: process.env.POSTGRES_HOST,
  db_port: Number(process.env.DB_PORT),
  username: process.env.POSTGRES_USERNAME,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_DB,
  port: Number(process.env.PORT),
  dialect: "postgres",
  aws_region: process.env.AWS_REGION,
  aws_profile: process.env.AWS_PROFILE,
  url: process.env.URL,
  aws_media_bucket: process.env.AWS_BUCKET,
  jwt: {
    secret: process.env.JWT_SECRET,
  },
};
console.log("user name is : " + config.username);
