#!/bin/bash

# 替换数据库环境变量
sed -i -e "s/ENV_DB_HOST/${ENV_DB_HOST}/" \
       -e "s/ENV_DB_PORT/${ENV_DB_PORT}/" \
       -e "s/ENV_DB_NAME/${ENV_DB_NAME}/" \
       -e "s/ENV_DB_USER/${ENV_DB_USER}/" \
       -e "s/ENV_DB_PASS/${ENV_DB_PASS}/" \
       ./docker/settings.py && cp ./docker/settings.py xops/settings.py

# makemigrations && migrate
python manage.py makemigrations rbac && python manage.py migrate

# init database
# python manage.py loaddata init_data/*.json
