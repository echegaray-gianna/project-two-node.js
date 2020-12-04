//DB connection
const {
    Pool
} = require("pg");
const connectionString = process.env.DATABASE_URL || "postgres://projecttwouser:project@localhost:5432/projecttwo";
const pool = new Pool({
    connectionString: connectionString
});

////////////////////////////////////////
////////// GET Movie From DB ///////////
///////////////////////////////////////

//get movie from DB

function getmovieFromDb(movie_id, callback) {
    //to know where the info is from
    console.log("get movie by movies from Db");

    //DB
    var sql = "SELECT movie.*, category.category_name, streaming.streaming_name FROM movie INNER JOIN category ON movie.category_id = category.category_id INNER JOIN streaming ON movie.streaming_id = streaming.streaming_id WHERE movie_id = $1::int ";

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

////////////////////////////////////////
///////// GET Movie by Search /////////
///////////////////////////////////////

function searchmoviebynameFromDb(movie_name, callback) {
    //to know where the info is from
    console.log("get movie by movies from Db");

    //DB
    var sql = "SELECT movie.*, category.category_name, streaming.streaming_name FROM movie INNER JOIN category ON movie.category_id = category.category_id INNER JOIN streaming ON movie.streaming_id = streaming.streaming_id WHERE movie_name = $1::text";

    var params = [movie_name];
    
    console.log("testing " + params);

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




//"SELECT movie.*, category.category_name, streaming.streaming_name, review.* FROM movie INNER JOIN category ON movie.category_id = category.category_id INNER JOIN streaming ON movie.streaming_id = streaming.streaming_id INNER JOIN review ON movie.movie_id = review.movie_id WHERE movie.movie_id = $1::int ";
///////////////////////////////////////
/////////// Module Exports ////////////
///////////////////////////////////////

module.exports = {
    getmovieFromDb:getmovieFromDb,
    searchmoviebynameFromDb:searchmoviebynameFromDb,
    
}