## PostgreSQL Setup and Management Instructions

### 1. Installation and Service Check

| Command | Why This Step Matters |
| :--- | :--- |
| `sudo apt update` | This command **refreshes your local list of software packages** from the Ubuntu repositories. It ensures you download the latest available version of PostgreSQL. |
| `sudo apt install postgresql postgresql-contrib` | This installs the main PostgreSQL server package (`postgresql`) and a package of **extra utilities and functions** (`postgresql-contrib`) that are useful for development and management. |
| `sudo systemctl status postgresql` | This **verifies that the PostgreSQL service is running** correctly. You should see `active (exited)` or `active (running)`. Press `q` to exit the status view. |

***

### 2. Accessing the Default Admin Account

PostgreSQL installs a superuser role called `postgres`. By default, you can only log into this database role by logging in as the corresponding Linux user, which is also called `postgres`.

| Command | Why This Step Matters |
| :--- | :--- |
| `sudo -u postgres psql` | This command **switches your current Linux user to the `postgres` system user** (`-u postgres`) and immediately launches the **PostgreSQL interactive terminal** (`psql`). This grants you administrative access to the database server. |
| `\conninfo` | Once inside the prompt, this command **confirms you are connected** as the `postgres` user to the `postgres` database. |
| `\q` | This command **exits the `psql` interactive terminal** and returns you to your standard Linux shell (as the original user). |

***

### 3. Creating a Secure Database Role (User)

It's a security best practice to **never use the `postgres` superuser** for application or daily use. Instead, create a dedicated, less privileged role.

* *Note: In the steps below, replace `<ejohnson>` with your desired database username and `<a_strong_password>` with a secure password.*

| Command (Run while logged in as `postgres` using `sudo -u postgres psql`) | Why This Step Matters |
| :--- | :--- |
| `CREATE ROLE <ejohnson> WITH ENCRYPTED PASSWORD 'a_strong_password' LOGIN;` | This creates a new **database role** (`<ejohnson>`). The `ENCRYPTED PASSWORD` option **secures the role** with a hash, and `LOGIN` explicitly allows this role to connect to the server. |
| `CREATE DATABASE <ejohnson> OWNER <ejohnson>;` | This creates a new **database** (named `<ejohnson>`) and sets the new role (`<ejohnson>`) as the **owner**. This gives the role full control over its own database, keeping it separate from other databases. |
| `\q` | **Exit** the `psql` prompt once you are done creating the role and database. |

***

### 4. Setting up Linux User for "Peer" Authentication

By default, PostgreSQL allows a Linux user to connect to a database role of the **same name** without a password. To leverage this simple and secure method, you need a matching Linux user.

* *Note: If you already have a Linux user with the same name as your database role, skip the first step.*

| Command | Why This Step Matters |
| :--- | :--- |
| `sudo adduser --disabled-password <ejohnson>` | This creates a **new Linux system user** with the same name as your database role. The `--disabled-password` option **prevents this user from being used for SSH login**, enhancing security if its only purpose is database access. |
| `sudo -u <ejohnson> psql` | This command **switches the system user** to `<ejohnson>` and opens the `psql` prompt. PostgreSQL automatically grants access because the Linux user name matches the database role name (`ejohnson`). |
| `\q` | **Exit** the `psql` prompt. |

***

### 5. Creating and Deleting Tables (Practical Application)

Now that you are connected, you can perform standard SQL operations.

* *Note: Run these commands inside the `psql` prompt.*

| Command | Why This Step Matters |
| :--- | :--- |
| `CREATE TABLE products (` | This statement **initializes the creation** of a new table named `products`. |
| `product_id SERIAL PRIMARY KEY,` | This creates a column for a unique identifier. `SERIAL` means the number **automatically increments**, and `PRIMARY KEY` enforces **uniqueness** and is used for fast lookups. |
| `name VARCHAR(255) NOT NULL,` | This creates a column for the product name. `VARCHAR(255)` is a **variable-length string** up to 255 characters, and `NOT NULL` ensures **every record must have a name**. |
| `price NUMERIC(10, 2));` | This creates a column for the price. `NUMERIC(10, 2)` is a data type that is **perfect for currency**, allowing 10 total digits with 2 digits after the decimal point. |
| `\dt` | This command **lists all tables** in your current database, allowing you to verify the table was created. |
| `DROP TABLE products;` | This command **permanently removes the `products` table** and all its data. It's used here for practice but should be used with caution in a production environment. |
