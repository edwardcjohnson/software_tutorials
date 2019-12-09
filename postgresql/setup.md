1. Installation
`sudo apt update`
`sudo apt install postgresql postgresql-contrib`
2. Using PostgreSQL Roles and Databases
Switch Over to the postgres Account with:
`sudo -i -u postgres`
Now access a Postgres prompt with:
`psql`
Exit with:
`\q`
3. Create a New Role
If you are currently logged in as the postgres account, then create a new user with:
`createuser --interactive`
4. Create a New Database
`createdb <db nname>`
