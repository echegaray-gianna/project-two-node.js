var express = require('express');
var app = express();


//Port
app.set("port", (process.env.PORT || 5000));
app.listen(app.get("port"), function () {
  console.log("Now listening from connections on port: ", app.get("port"));
});

//DB connection
const {
  Pool
} = require("pg");
const connectionString = process.env.DATABASE_URL || "postgres://projecttwouser:project@localhost:5432/projecttwo";
const pool = new Pool({
  connectionString: connectionString
});

//Static Access
app.use(express.static(__dirname + '/public'));

// View Access
app.set("views", "views");
// set the view engine to ejs
app.set('view engine', 'ejs');




////////////////////////////////////////
//////// GET Categories view ///////////
///////////////////////////////////////

//get categories

app.get('/getcategory', getcategory);

function getcategory(req, res) {

  console.log("getting category information ");


  getcategoryFromDb(function (error, result) {
    if (error) {
      response.status(500).json({
        success: false,
        data: error
      });

    } else {
      //info is correct

      const params = {
        categories: result
      };
      res.render("pages/getcategories", params)

      console.log("back from the getcategoryFrom DB DB with result:", result);


    }
  })
}

//get categories from DB

function getcategoryFromDb(callback) {
  //to know where the info is from
  console.log("get category from Db");

  //DB
  var sql = "SELECT * FROM category";
  pool.query(sql, function (err, result) {
    if (err) {
      console.log("An error with db ocurred");
      console.log(err);
      callback(err, null);
    }

    console.log("found Db result:" + JSON.stringify(result.rows));
    callback(null, result.rows);

  });
}



////////////////////////////////////////
//////// GET Streaming view ///////////
///////////////////////////////////////

//get streaming
app.get('/getstreaming', getstreaming);


function getstreaming(req, res) {

  console.log("getting category information ");


  getstreamingFromDb(function (error, result) {
    if (error) {
      response.status(500).json({
        success: false,
        data: error
      });

    } else {
      //info is correct

      const params = {
        streaming: result
      };
      res.render("pages/getstreaming", params)

      console.log("back from the getstreamingFrom DB with result:", result);


    }
  })
}

//get streaming from DB

function getstreamingFromDb(callback) {
  //to know where the info is from
  console.log("get streaming from Db");

  //DB
  var sql = "SELECT * FROM streaming";
  pool.query(sql, function (err, result) {
    if (err) {
      console.log("An error with db ocurred");
      console.log(err);
      callback(err, null);
    }

    console.log("found Db result:" + JSON.stringify(result.rows));
    callback(null, result.rows);

  });
}