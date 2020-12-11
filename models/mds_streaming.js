//DB connection
const {
    Pool
} = require("pg");
const connectionString = process.env.DATABASE_URL || "postgres://projecttwouser:project@localhost:5432/projecttwo";
const pool = new Pool({
    connectionString: connectionString
});


////////////////////////////////////////
/////// GET Streaming From DB //////////
///////////////////////////////////////

function getstreamingFromDb(callback) {
    //to know where the info is from
    console.log("get streaming from Db");

    //DB
    var sql = "SELECT * FROM streaming ORDER BY streaming_name ASC";
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
/////// GET Streaming From DB //////////
///////////////////////////////////////

function getmoviebystreamingFromDb(streaming_id, callback) {
    //to know where the info is from
    console.log("get movies by streaming from Db");

    //DB
    var sql = "SELECT * FROM movie WHERE streaming_id = $1::int ORDER BY movie_name ASC ";

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


///////////////////////////////////////
/////////// Module Exports ////////////
///////////////////////////////////////

module.exports = {
    getstreamingFromDb:getstreamingFromDb,
    getmoviebystreamingFromDb:getmoviebystreamingFromDb,
}