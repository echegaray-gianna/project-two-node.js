////////////////////////////////////////
///////// Models Connections //////////
///////////////////////////////////////

// mds_review.js Access
const bodyParser = require('body-parser');
const mds_review = require('../models/mds_review');


////////////////////////////////////////
///////////// GET Review //////////////
///////////////////////////////////////

function getreview(req, res) {
    console.log("getting movies reviews");

    //getting the information from see_reviews() $get(/getreview search_movie)
    const movie_id = req.query.search_review;

    console.log("getreview inside movie_id" + movie_id);

    //getting the streaming info from the mds_movie
    var getreviewFromDb = mds_review.getreviewFromDb;

    getreviewFromDb(movie_id, function (error, result) {
        if (error) {
            response.status(500).json({
                success: false,
                data: error
            });

        } else {
            //info is correct
            res.json(result)

        }
    })
};



////////////////////////////////////////
///////////// Post Review //////////////
///////////////////////////////////////


function postreview(req, res) {
    console.log("ready to post review");

    //getting the information from getmovie.ejs//leave_a_review()
    const review_details_post = req.query.review_leave;
    const review_movie_id = req.query.movie_info_for_review;

    if (review_details_post == "") {

        const params = {
            review_movie_id: review_movie_id
        };

        res.render('pages/tryagain', params)


    } else {

        console.log("getreview inside review details" + " " + review_details_post);
        console.log("getreview inside review review movie id" + " " + review_movie_id);

        //getting the streaming info from the mds_movie
        var postreviewFromDb = mds_review.postreviewFromDb;

        postreviewFromDb(review_details_post, review_movie_id, function (error) {
            if (error) {
                response.status(500).json({
                    success: false,
                    data: error
                });

            } else {


                const params = {
                    review_movie_id: review_movie_id
                };

                res.render('pages/thanks', params)




            }
        })
    }
};




///////////////////////////////////////
/////////// Module Exports ////////////
///////////////////////////////////////

module.exports = {
    getreview: getreview,
    postreview: postreview
};