// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function() {

  //list of upcoming movies
  $.ajax('https://api.themoviedb.org/3/movie/now_playing?api_key=4cd9d92801f92d8885c5df0bcff5b0e6&language=en-US&page=1', {
    success: function(response) {
      var upcomingMovies = []

      for (var i = 0; i < response['results'].length; i++){
        upcomingMovies.push(
          "<tr>" + "<td>" + response['results'][i]['original_title'] + "</td>" 
          + "<td>" + "<a href='reviews/new/?id="+ response['results'][i]['id'] +"'>" + 'Leave a review' + "</a></td>"  + "</tr>"
        );
      }

      for (var i = 0; i < upcomingMovies.length; i++) {
        $('#movieList').find('tbody').append(upcomingMovies[i])
      };

    }
  });

  //single movie
  var id = $('#movieName').html()
  $.ajax('https://api.themoviedb.org/3/movie/' + id + '?api_key=4cd9d92801f92d8885c5df0bcff5b0e6&language=en-US', {
      success: function(response){
        $('#movieName').html(response['original_title'])
      }
  });

});