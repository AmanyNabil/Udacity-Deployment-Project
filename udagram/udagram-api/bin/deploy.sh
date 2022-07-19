eb init udagram-api --platform node.js --region us-east-1 &&
eb use env-udagram-api &&
eb deploy env-udagram-api &&
eb setenv POSTGRES_HOST=$POSTGRES_HOST POSTGRES_USERNAME=$POSTGRES_USERNAME POSTGRES_PASSWORD=$POSTGRES_PASSWORD POSTGRES_DB=$POSTGRES_DB PORT=$PORT URL=$URL JWT_SECRET=$JWT_SECRET