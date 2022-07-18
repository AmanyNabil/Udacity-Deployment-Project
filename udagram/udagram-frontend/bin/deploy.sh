aws s3 cp --recursive --acl public-read ./www s3://myawsbucket-75139724085/
aws s3 cp --acl public-read --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./www/index.html s3://myawsbucket-75139724085/

cd ./www &&
eb init udagram-api --platform node.js --region us-east-1 &&
eb use udagram-api-env
eb setenv POSTGRES_HOST=$POSTGRES_HOST PORT=$DB_PORT POSTGRES_USERNAME=$POSTGRES_USERNAME POSTGRES_PASSWORD=$POSTGRES_PASSWORD POSTGRES_DB=$POSTGRES_DB DB_PORT=$PORT RDS_DIALECT=$RDS_DIALECT AWS_REGION=$AWS_REGION URL=$URL JWT_SECRET=$JWT_SECRET EP_APP=$EP_APP EB_ENV=$EB_ENV AWS_BUCKET=$AWS_BUCKET
eb deploy