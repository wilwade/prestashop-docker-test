# prestashop-docker-test
Test PrestaShop with Docker

## IMPORTANT
This will *NOT* persist any data. It is for use with testing modules and other temporary uses!

## Run
- `docker build -t wilwade/prestashop-docker-test .`
- `docker run -d -p 80:80 --name prestashop wilwade/prestashop-docker-test`

## Installing PrestaShop
Before you can use PrestaShop, you have to run through the install process.

This Docker image allows root MySQL access with no password internally.

1. Visit http://localhost:80
2. Follow install process and allow PrestaShop to create the database
3. After you install run `docker exec prestashop rm -Rf /app/install`
4. To show the admin directory name run `docker exec prestashop find /app -name "admin*" -maxdepth 1`
