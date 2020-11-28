//DB connection
const {
    Pool
} = require("pg");
const connectionString = process.env.DATABASE_URL || "postgres://projecttwouser:project@localhost:5432/projecttwo";
const pool = new Pool({
    connectionString: connectionString
});


////////////////////////////////////////
/////// GET categories from DB /////////
///////////////////////////////////////

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


///////////////////////////////////////
//////// GET movies from DB ///////////
///////////////////////////////////////

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


///////////////////////////////////////
/////////// Module Exports ////////////
///////////////////////////////////////

module.exports = {
    getcategoryFromDb:getcategoryFromDb,
    getmoviebycategoryFromDb:getmoviebycategoryFromDb,
}