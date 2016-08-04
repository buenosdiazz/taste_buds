// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).on("turbolinks:load",function() {


    var category_id = $('#js-add-item').data("category")

    $('#js-item-form').on('submit', function(event) {
        event.preventDefault()
        var query = $('#newitem').val();
        searchMovie(query);

        // console.log(query)
    });



    function searchMovie(query) {
        if (category_id == 2) {
            var the_url = "https://api.themoviedb.org/3/search/movie?api_key=1ca20fcae4b205492fa563680dd580ed&query=" + query
        } else if (category_id == 3) {
            var the_url = "https://api.themoviedb.org/3/search/tv?api_key=1ca20fcae4b205492fa563680dd580ed&query=" + query
        } else if (category_id == 1) {
            var the_url = "https://api.spotify.com/v1/search?q=" + query + "&type=artist&limit=1"
        } else {
            the_url = "/"
        }
        $.ajax({
            type: "GET",
            url: the_url,
            success: showMovie,
            error: handleError,
        });
    }

    function showMovie(response) {
        console.log(response);


        if (category_id == 2) {
            var Movie = response.results[0].title;
            var MoviePoster = response.results[0].poster_path;
            var posterlink = "http://image.tmdb.org/t/p/w154" + MoviePoster;
            var description = response.results[0].overview;
            $("#itemss").append(
                `<div class="box col4 lists">  
            <div class = "row" align= "center" >
                <h5 > <strong>${Movie}
                 </strong></h5> 
            </div>
                <div class = "dividerr" > </div>
                <div class = "row">
                    <div class ="col-sm-5" align="center" >
                        <div class = "dividerr" > </div>
                        <img src =${posterlink}style= "width: 80%; height: 80%" > <br> 
                     </div>

                   <div class ="col-sm-7" align= "left">  <h6> <strong> Description: </strong> ${description}</h6>
                   </div>
                   </div>
                   <div class= "row" align= "center" >
                       <button type="button" class="btn btn-default btn-xs deleteicon" data-itemid= "0" >
                       <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                       </button>
                   </div>
                </div>
        </div>`)
        } else if (category_id == 3) {
            var Movie = response.results[0].name;
            var MoviePoster = response.results[0].poster_path;
            var posterlink = "http://image.tmdb.org/t/p/w154" + MoviePoster;
            var description = response.results[0].overview;
            $("#itemss").append(
                `<div class="box col4 lists">  
            <div class = "row" align= "center" >
                <h5 > <strong>${Movie}
                 </strong></h5> 
            </div>
                <div class = "dividerr" > </div>
                <div class = "row">
                    <div class ="col-sm-5" align="center" >
                        <div class = "dividerr" > </div>
                        <img src =${posterlink}style= "width: 80%; height: 80%" > <br> 
                     </div>

                   <div class ="col-sm-7" align= "left">  <h6> <strong> Description: </strong> ${description}</h6>
                   </div>
                </div>
                   <div class= "row" align= "center" >
                       <button type="button" class="btn btn-default btn-xs deleteicon" data-itemid= "0" >
                       <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                       </button>
                   </div>
                </div>
        </div>`)

        } else if (category_id == 1) {
            var Movie = response.artists.items[0].name;
            var posterlink = response.artists.items[0].images[2].url;
              $("#itemss").append(
                `<div class="box col4 lists">  
            <div class = "row" align= "center" >
                <h5 > <strong>${Movie}
                 </strong></h5> 
            </div>
                <div class = "dividerr" > </div>
                <div class = "row">
                    <div class ="col-sm-5" align="center" >
                        <div class = "dividerr" > </div>
                        <img src =${posterlink} style= "width: 80%; height: 80%" > <br> 
                     </div>

                   <div class ="col-sm-7" align= "left">  <h6> <strong> Description: </strong> Music Artist</h6>
                   </div>
                </div>
                   <div class= "row" align= "center" >
                       <button type="button" class="btn btn-default btn-xs deleteicon" data-itemid= "0" >
                       <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                       </button>
                   </div>
                </div>
        </div>`)
  }



        else {
            var movie = "hello ";
        }



        var string = String(Movie);

        var list_id = $('#js-new-item').data("list");

        var data_to_be_sent = { name: string, poster: posterlink, description: description };

        newItem(data_to_be_sent);

        function newItem(data_to_be_sent) {
            $.ajax({
                type: "POST",
                url: "/lists/" + list_id + "/items/add",
                data: data_to_be_sent,
                success: function(data, textStatus, jqXHR){
                  $('#newitem').val("")
                },
                error: handleError,
            });
        }

    }

    function handleError(err) {
        console.log("Error!", err);
    }

    var item_id = $('.deleteicon').data("itemid");

    $('.deleteicon').on('click', function(event) {
        event.preventDefault();
        var list_id = $('#js-new-item').data("list");
        var item_id = $(this).data("itemid");
        var $container = $(this).closest("div.box")
        console.log(item_id)
        $.ajax({
            type: "DELETE",
            url: `/lists/${list_id}/items/${item_id}/deleteitem`,
            data: { id: item_id },
            success: function(response) {
              $($container).remove();

            },
            error: handleError,
        });


    });

    // function deleteitem(data_to_send) {
    //     var list_id = $('#js-new-item').data("list");
    //     var itemid = parseInt(event.currentTarget.attributes[2].nodeValue);
    //     console.log(list_id);
    //     $.ajax({
    //         type: "DELETE",
    //         url: "/lists/" + list_id + "/items/" + itemid + "/deleteitem",
    //         data: data_to_send,
    //         error: handleError,
    //     });
    // }




})
