////////////////////////////////////////
//////////// GET Reviews //////////////
///////////////////////////////////////

function see_reviews() {
    console.log("getting review");
    var search_review = $('#movie_info_for_review').val()

    console.log('search review for movie ' + search_review);

    $.get('/getreview', {
        search_review: search_review
    }, function (info) {

        if (info.list == "") {
            //dont leave the before search result 
            $('#review_result').empty();

            $('#review_result').append('<p class= no_info> Sorry! We dont have any reviews for that movie yet. </p>')

        } else {

            //dont leave the before search result 
            $('#review_result').empty();

            var details= info;

            console.log ("here at details " + details);
            
            for (var i = 0; i < details.list.length; i++) {
                var review_info = details.list[i];

                console.log ("from clientside" + review_info)

                var rThree = '<li class="review_description">' + review_info.to_char + ":  ' " + review_info.review_description + " '" + '</li>';
                

                $('#review_result').append( rThree);

            }
        }
    })

}


