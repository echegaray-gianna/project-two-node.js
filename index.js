var express = require('express');
var app = express();

app.set("port",(process.env.PORT || 5000));

app.listen(app.get("port"), function(){
  console.log("Now listening from connections on port: ", app.get("port"));
});



//DB connection
const { Pool } = require("pg");
const connectionString = process.env.DATABASE_URL || "postgres://projecttwouser:project@localhost:5432/projecttwo";
const pool = new Pool ({connectionString: connectionString});


//to plain htm, img, css 
app.use(express.static("public"));

app.get('/getcategory',getcategory);

// for the views
app.set("views", "views");
// set the view engine to ejs
app.set('view engine', 'ejs');
// use res.render to load up an ejs view file


function getcategory(req, res) {
  console.log ("getting category information ");

  var category_id = req.query.category_id;
  console.log ("retrieving category with id: ", category_id);

  getcategoryFromDb (category_id, function(error, result) {
    console.log ("back from the getcategoryFrom DB DB with result:", result);
    res.json(result);

  })
}



function getcategoryFromDb(category_id, callback) {
  console.log ("get category from Db called with id:", category_id);

  var sql = "SELECT * FROM category WHERE category_id = $1::int";
  var params = [category_id];
  pool.query(sql, params, function(err,result){
    if(err){
      console.log("an error with db ocurred");
      console.log(err);
      callback(err,null);
    }

    console.log("found Db result:" + JSON.stringify(result.rows));
    callback(null, result.rows);
  
  });
}


