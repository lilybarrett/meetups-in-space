//JAVASCRIPT CODE GOES HERE

$(document).ready(function() {

 $('.join-button').on("click", function(event) {
   event.preventDefault();

   var meetup_id = window.location.pathname.match(/\d+/)[0];

   var request = $.ajax({
     method: "POST",
     url: "/meetups/" + meetup_id
  })

  request.done(function(data) {
    var data = JSON.parse(data);
    $("#flash-container").append(data.message);
    if (data.member != null) {
        var user = data.member;
        $("#yield-container").append("<div class='member'>" + "<img src=" + user.avatar_url + "/>" + "<span class='caption'>" + user.username + "</span>" + "</div>");
      }
    })

});

})
