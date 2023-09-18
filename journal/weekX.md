# Week X — Clean Up Week


### Cruddur Database Setup (RDS)
RDS Connection:
- add new inbound connection for gitpod ip in the RDS Security Group created by CFN
- update `DB_SG_ID` and `DB_SG_RULE_ID` env vars for the `update-sg-rule` script
- test connect to prod
  
Creating Cruddur Tables:
- load schema `./bin/db/schema-load prod`
- add bio column from migration `CONNECTION_URL=$PROD_CONNECTION_URL ./bin/db/migrate`

Fix Lambda-RDS Connection:
- update connection_url var in lambda
- add SG for Cognito Lambda in the cfn cluster network vpc
  - doesn't need inbound rules
- add inbound security group rule in the RDS SG that uses the newly created Cognito-Lambda SG for cognito post signup confirmation 
