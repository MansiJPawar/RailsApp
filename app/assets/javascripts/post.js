$(function(){
  // on comment icon select , focus on comment
  $("#post-comment").on("click", function(){
    // get id comment_comment from console
    $('#comment_comment').focus();
  });
  $(".post-like").on("click", function(){
    var post_id = $(this).data("id");

    $.ajax({
      url:"/post/like/"+post_id,
      method: "GET"
    }).done(function(response){
        console.log(response);
     }) })
});


