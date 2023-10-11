const mysql2 = require("mysql2");

const connect_db = mysql2.createConnection({
  host: "localhost",
  user: "root",
  port: 3306,
  password: "Lyh30121501",
  database: "Insurance",
  insecureAuth: "true",
});

connect_db.connect((err) => {
  if (err) console.log("Connect failure!!!");
  else {
    console.log("Connect succesfully!!!");
  }
});

module.exports = connect_db;
