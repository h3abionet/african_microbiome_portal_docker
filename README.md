# Docker

General Docker Configuration for African Microbiome Portal.

# Before you execute

Please add following to .env file and change the values of the fields accordingly.
- EMAIL_HOST=<email host smtp server address>
- EMAIL_PORT=587
- EMAIL_HOST_USER=<docker@example.com>
-	EMAIL_HOST_PASSWORD=<email passpword>
SECRET_KEY=<long django secrete key>
ADMINS="User One" <user.one@example.com>, "User Two" <user.two@example.com>


# Step to execute

1. Building Docker Image - `docker-compose build --no-cache`
- This step is not required to execute each time for running the database.
2. Running Database - `docker-compose up`
3. Accessible using browser at `127.0.0.1:1300`
