////////////////////////////////////////
//////// Connections / Access /////////
///////////////////////////////////////

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
////// Controllers Connections /////////
///////////////////////////////////////

// ctrs_category.js Access
const ctrs_category = require('./controllers/ctrs_category');

// ctrs_streaming.js Access
const ctrs_streaming = require('./controllers/ctrs_streaming');

// ctrs_streaming.js Access
const ctrs_movie = require('./controllers/ctrs_movie')

////////////////////////////////////////
////// GET Functions From Ctrs /////////
///////////////////////////////////////

//Get the getcategory function from ctrs_category.js
app.post('/getcategory', ctrs_category.getcategory);

//Get the getstreaming function from ctrs_category.js
app.post('/getstreaming', ctrs_streaming.getstreaming);

//Get the getmoviebycategory function from ctrs_category.js
app.get('/getmoviebycategory', ctrs_category.getmoviebycategory);

//Get the getmoviebystreaming function from ctrs_streaming.js
app.get('/getmoviebystreaming', ctrs_streaming.getmoviebystreaming);

//Get the getmovie function from ctrs_streaming.js
app.get('/getmovie', ctrs_movie.getmovie);

//Get the getmovie function from ctrs_streaming.js
app.get('/searchmoviebyname', ctrs_movie.searchmoviebyname);


