post '/add_comment/:id' do
	
	if session[:user_id]
		current_user
		@post = Post.find(params[:id])
		@comment = params[:comment]
		Comment.create(comment: @comment, user_id: @current_user.id, post_id: @post.id)
		erb :view_post
	else
		@flash = "Please log in or sign up to comment."
		erb :login
	end
end

get '/user_comments/:id' do

	@comment = Comment.where(user_id: params[:id])

	erb :user_comments
end

get '/comment_vote/:id' do

	if session[:user_id]
		current_user
		@comment = Comment.find(params[:id])
		@post = Post.find(@comment.post_id)

		if Comment.check_duplicate_vote(@comment.id, @current_user.id)
			@flash = "You can only vote once per comment!"
			erb :view_post
		else
			CommentVote.create(user_id: @current_user.id, comment_id: @comment.id)
			erb :view_post
		end
	else
		@flash = "Please log in or sign up to vote."
		erb :login
	end
end