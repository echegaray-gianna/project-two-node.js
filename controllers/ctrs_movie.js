////////////////////////////////////////
////// Models Connections /////////
///////////////////////////////////////

// mds_streaming.js Access
const mds_movie = require('../models/mds_movie');


////////////////////////////////////////
///////////// GET Movie ///////////////
///////////////////////////////////////

function getmovie(req, res) {
    console.log("getting movies by movies information ");

    //getting the movie_id from the view (category and streaming)
    const movie_id = req.query.movie_id;

    //getting the streaming info from the mds_movie
    var getmovieFromDb = mds_movie.getmovieFromDb;

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



////////////////////////////////////////
///////// GET Movie by Search /////////
///////////////////////////////////////

function searchmoviebyname(req, res){
    console.log("getting movies by search information ");

    const movie_name = (req.query.search_movie).toLowerCase().trim();
    
    var searchmoviebynameFromDb = mds_movie.searchmoviebynameFromDb;

    searchmoviebynameFromDb(movie_name, function (error, result) {
        if (error) {
            response.status(500).json({
                success: false,
                data: error
            });

        } else {
              res.json(result)

            //console.log("back from the getmovieFromDB with result:", result);


        }
    })

}

///////////////////////////////////////
/////////// Module Exports ////////////
///////////////////////////////////////

module.exports = {
    getmovie: getmovie,
    searchmoviebyname:searchmoviebyname,
};