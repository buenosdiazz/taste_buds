// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


 $(document).ready(function(){

  $('#js-item-form').on('submit', function(event) {
    event.preventDefault()
    var query = $('#newitem').val();
    searchMovie(query);
    // console.log(query)
  });

var list_id = $('#js-add-item').data("list");

   function searchMovie(query) {
  $.ajax({
    type: "GET",
    url: "https://api.themoviedb.org/3/search/movie?api_key=1ca20fcae4b205492fa563680dd580ed&query="+query,
    success: showMovie,
    error: handleError,
  });
  }

  function showMovie(response) {
    console.log(response);

     var Movie = response.results[0].original_title;
     var MoviePoster = response.results[0].poster_path;
      $("#items").append("<li>"+Movie+"</li>");
      $("#items").append("<img src="+"http://image.tmdb.org/t/p/w154"+MoviePoster+">");
      var posterlink = "http://image.tmdb.org/t/p/w154"+MoviePoster
      var string = String(Movie);
      
 
      data_to_be_sent = {name: string, poster: posterlink};
      newItem(data_to_be_sent);

      function newItem(data_to_be_sent){
        $.ajax({
            type: "POST",
              url: "/lists/"+list_id+"/items/add",
              data: data_to_be_sent,
              success: console.log(posterlink),
              error: handleError,
          });
      }

 }
 function handleError(err) {
  console.log("Error!", err);
  }
})
  