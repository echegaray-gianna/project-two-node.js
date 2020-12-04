////////////////////////////////////////
///////// Models Connections //////////
///////////////////////////////////////

// mds_category.js Access
const mds_category = require('../models/mds_category');

////////////////////////////////////////
//////// GET Categories view //////////
///////////////////////////////////////

function getcategory(req, res) {

    console.log("getting category information ");

    //getting the category info from the mds_category
    var getcategoryFromDb = mds_category.getcategoryFromDb;
    
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


///////////////////////////////////////
////// GET Movie by Category //////////
///////////////////////////////////////

//get movie by categories

function getmoviebycategory(req, res) {

    console.log("getting movies by categories information ");

    //getting the category info from the mds_category
    var getmoviebycategoryFromDb = mds_category.getmoviebycategoryFromDb;

    //getting the category_id from the view
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

            console.log("back from the getmoviebycategoryFromDb with result:", result);


        }
    })
}



///////////////////////////////////////
/////////// Module Exports ////////////
///////////////////////////////////////

module.exports = {
    getcategory: getcategory,
    getmoviebycategory: getmoviebycategory,
};