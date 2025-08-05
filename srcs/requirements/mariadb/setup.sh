#!/bin/bash
set -e

mysql -u root <<-EOSQL
    CREATE DATABASE IF NOT EXISTS inception;
    CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
    GRANT ALL PRIVILEGES ON inception.* TO 'user'@'%';
    FLUSH PRIVILEGES;
EOSQL