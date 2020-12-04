////////////////////////////////////////
//////// GET Movie From SERACH /////////
///////////////////////////////////////

//clean Info
function clearSearch() {
    searchResults.length = 0;
}

//search function

function search_by_name() {
    console.log("searchiong by name");
    var search_movie = $('#search_movie').val()

    if (search_movie == "") {
        $('#movie_result').empty();
        $('#movie_result').append('<p class= no_info> Please enter a movie name! </p>')

    } else {


        console.log('movie ' + search_movie);

        $.get('/searchmoviebyname', {
            search_movie: search_movie
        }, function (data) {

            if (data == "") {

                //dont leave the before search result
                $('#movie_result').empty();
                // clean the search box
                document.getElementById('search_movie').value = '';

                $('#movie_result').append('<p class= no_info> Sorry! We dont have that movie in our system. </p>')

            } else {

                //dont leave the before search result
                $('#movie_result').empty();
                // clean the search box
                document.getElementById('search_movie').value = '';

                console.log("here is what movie_info have inside : ")
                console.log(data);


                var movie_info = data;

                var tOne = '<img src=" ' + (movie_info[0].movie_img) + '" alt= "movie Picture" class="movie_img_search">';
                var tTwo = '<h3 class= "movie_subtitle_search">' + (movie_info[0].movie_name) + '</h3>';
                var tThree = '<p class="date">' + (movie_info[0].movie_date) + '</p>';
                var tFour = '<p class="duration"> <span> duration</span>:' + (movie_info[0].movie_duration) + '</p>';
                var tFour = '<p class="category_info"> <span> Category</span>: ' + (movie_info[0].category_name) + '</p>';
                var tFive = '<p class="streaming_info"> <span> Streaming at</span>: ' + (movie_info[0].streaming_name) + '</p>';
                var tSix = '<a href= "' + (movie_info[0].movie_trailer) + '" target= "_blank"> Play trailer on YouTube</a>';
                var tSeven = '<p class="actors"> <span> Actors</span>: ' + (movie_info[0].movie_actors) + '</p>';
                var tEight = '<p class="description">' + (movie_info[0].movie_description) + '</p>';

                $('#movie_result').append(tOne, tTwo, tThree, tFour, tFive, tSix, tSeven, tEight)



            }

        })
    }
};