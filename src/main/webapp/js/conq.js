var mysql = require('mysql');
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Aniket123",
  database: "iwt"
});
con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT * FROM iwt_users", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});
