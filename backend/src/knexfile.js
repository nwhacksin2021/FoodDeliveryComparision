const knex = require('knex')({
  client: 'mysql',
  connection: {
    host : process.env.DB_HOST,
    user : process.env.DB_USER, 
    password : process.env.DB_USER_PASS,
    database : process.env.DB_NAME,
    port: process.env.DB_PORT 
  }
});

module.exports = knex