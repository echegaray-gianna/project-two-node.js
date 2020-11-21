var express = require('express');
var app = express();

const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


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


////////////////////////////////////////
////// GET Movie by Category //////////
///////////////////////////////////////

//get movie by categories

app.get('/getmoviebycategory', getmoviebycategory);

function getmoviebycategory(req, res) {
  console.log("getting movies by categories information ");


  const category_id = req.query.category_id;

  getmoviebycategoryFromDb(category_id, function (error, result) {
    if (error) {
      response.status(500).json({
        success: false,
        data: error
      });

    } else {
      //info is correct

      const params = {
        moviecat: result
      };
      
      res.render("pages/getmoviebycategory", params)

      console.log("back from the getmoviebycategoryFromDB with result:", result);


    }
  })
}

//get movies from DB

function getmoviebycategoryFromDb(category_id, callback) {
  //to know where the info is from
  console.log("get movies by categories from Db");

  //DB
  var sql = "SELECT * FROM movie WHERE category_id = $1::int ";
  
  var params = [category_id];

  pool.query(sql, params, function (err, result) {
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
////// GET Movie by Streaming //////////
///////////////////////////////////////


app.get('/getmoviebystreaming', getmoviebystreaming);

function getmoviebystreaming(req, res) {
  console.log("getting movies by streaming information ");

  const streaming_id = req.query.streaming_id;


  getmoviebystreamingFromDb(streaming_id, function (error, result) {
    if (error) {
      response.status(500).json({
        success: false,
        data: error
      });

    } else {
      //info is correct

      const params = {
        moviestr: result
      };
      
      res.render("pages/getmoviebystreaming", params)

      console.log("back from the getmoviebystreamingFromDB with result:", result);


    }
  })
}

//get categories from DB

function getmoviebystreamingFromDb(streaming_id, callback) {
  //to know where the info is from
  console.log("get movies by streaming from Db");

  //DB
  var sql = "SELECT * FROM movie WHERE streaming_id = $1::int ";
  
  var params = [streaming_id];

  pool.query(sql, params, function (err, result) {
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
///////////// GET Movie ///////////////
///////////////////////////////////////


app.get('/getmovie', getmovie);

function getmovie(req, res) {
  console.log("getting movies by movies information ");

  const movie_id = req.query.movie_id;


  getmovieFromDb(movie_id, function (error, result) {
    if (error) {
      response.status(500).json({
        success: false,
        data: error
      });

    } else {
      //info is correct

      const params = {
        movieinfo: result
      };
      
      res.render("pages/getmovie", params)

      console.log("back from the getmovieFromDB with result:", result);


    }
  })
}

//get movie from DB

function getmovieFromDb(movie_id, callback) {
  //to know where the info is from
  console.log("get movie by movies from Db");

  //DB
  var sql = "SELECT * FROM movie WHERE movie_id = $1::int ";
  
  var params = [movie_id];

  pool.query(sql, params, function (err, result) {
    if (err) {
      console.log("An error with db ocurred");
      console.log(err);
      callback(err, null);
    }

    console.log("found Db result:" + JSON.stringify(result.rows));
    callback(null, result.rows);

  });
}