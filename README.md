# estore
# Database details (Edit knexfile.js in node/modules/db/knexfile.js)
```
 host: 'localhost',
 user: 'postgres',
 password: 'password',
 database: 'estore',
 port:5432

```
 # Run Node JS Code (Skip knex migrate and seed commands if you are using dump file)
 ```
 cd node
 npm install
 npm run knex migrate:latest //Make sure an empty database named estore is exists in psql local. 
 npm run knex seed:run
 node app
```
# Run Angular Project
 ```
 cd angular
 npm install
 ng serve --o
 ```
