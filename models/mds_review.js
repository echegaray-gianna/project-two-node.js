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

function getreviewFromDb(movie_id, callback) {

    //DB
    var sql = "SELECT review.*, TO_CHAR(review_date, 'MON-DD-YYYY HH12:MIPM') FROM review WHERE movie_id = $1::int ORDER BY review_date DESC";

    var params = [movie_id];

    pool.query(sql, params, function (err, result) {
        if (err) {
            console.log("An error with db ocurred");
            console.log(err);
            callback(err, null);
        }

        console.log("found Db result:" + JSON.stringify(result.rows));
        
        var results={list:result.rows }

        callback(null,results);

    });
}

////////////////////////////////////////
//////// Insert Review Into DB /////////
///////////////////////////////////////

//get movie from DB

function postreviewFromDb(review_details_post, review_movie_id, callback) {

    //DB
    var sql = " INSERT INTO review (review_description, movie_id) Values ($1::text, $2::int) ";
    
    var params = [review_details_post, review_movie_id,];

    console.log(" Inside PostreviewFRomDb " + params);

    pool.query(sql, params, function (err, result) {
        if (err) {
            console.log("An error with db ocurred");
            console.log(err);
            callback(err, null);
        }

        callback(null, result.rows);

    });
}



///////////////////////////////////////
/////////// Module Exports ////////////
///////////////////////////////////////

module.exports = {
    getreviewFromDb: getreviewFromDb,
    postreviewFromDb: postreviewFromDb

}