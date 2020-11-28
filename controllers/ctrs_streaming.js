////////////////////////////////////////
////// Models Connections /////////
///////////////////////////////////////

// mds_streaming.js Access
const mds_streaming = require('../models/mds_streaming');


////////////////////////////////////////
//////// GET Streaming view ///////////
///////////////////////////////////////

function getstreaming(req, res) {

    console.log("getting category information ");

    //getting the streaming info from the mds_streaming
    var getstreamingFromDb = mds_streaming.getstreamingFromDb;

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


////////////////////////////////////////
////// GET Movie by Streaming //////////
///////////////////////////////////////

function getmoviebystreaming(req, res) {
    console.log("getting movies by streaming information ");

    //getting the streaming_id from the view
    const streaming_id = req.query.streaming_id;

    //getting the streaming info from the mds_streaming
    var getmoviebystreamingFromDb = mds_streaming.getmoviebystreamingFromDb;


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


///////////////////////////////////////
/////////// Module Exports ////////////
///////////////////////////////////////

module.exports = {
    getstreaming: getstreaming,
    getmoviebystreaming: getmoviebystreaming,

};