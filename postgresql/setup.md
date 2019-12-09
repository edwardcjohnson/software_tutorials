Source: https://www.digitalocean.com/community/tutorials/how-to-create-remove-manage-tables-in-postgresql-on-a-cloud-server
1. Installation
`sudo apt update`
`sudo apt install postgresql postgresql-contrib`
2. Using PostgreSQL Roles and Databases
* Switch Over to the postgres Account with:
`sudo -i -u postgres`
* Now access a Postgres prompt with:
`psql`
* Exit with:
`\q`
3. Create a New Role
* Create a new user that matches the system user you have or created. Then create a database managed by that user:
`CREATE USER <postgres_user> WITH PASSWORD 'password';`
`CREATE DATABASE <my_postgres_db> OWNER <postgres_user>;`
4. Create a New Database
* if the user you created in the last section is called `ejohnson`, that role will attempt to connect to a database which is also called `ejohnson` by default.
* Create the db:
`createdb ejohnson
5. Open a Postgres Prompt with the New Role
* To log in with ident based authentication, you’ll need a Linux user with the same name as your Postgres role and database.
  * If the linux user is not aleady created, then create it with:
  `sudo adduser ejohnson`
  * Switch to the new account and connect to the database:
  `sudo -u ejohnson psql`
  * If you want your user to connect to a different database, you can do so by specifying the database like this: 
 `psql -d <db>`
 * Once logged in, you can get check your current connection information by typing:
`\conninfo`
6. Creating and Deleting Tables
* Ref: https://www.digitalocean.com/community/tutorials/how-to-create-remove-manage-tables-in-postgresql-on-a-cloud-server
