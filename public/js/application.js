$(document).ready(function(event) {

	$("#vote_post").click(function(event) {
		var postId = $("#vote_post").data("post-id");
		
		$.ajax( {
			type: "GET",
			url: "/post_vote/" + postId, 
			data: {id: postId}
		}).event.preventDefault();

		// $("#list-to-sort > tr").sort_by($(".count"), ASC);
	});

	$("#vote_comment").click(function(event) {
		var commentId = $("#comment_post").data("comment-id");
		
		$.ajax( {
			type: "GET",
			url: "/post_vote/" + commentId, 
			data: {id: commentId}
		}).event.preventDefault();
		
		// $("#list-to-sort").sort_by($(".count"), ASC);
	});

  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
