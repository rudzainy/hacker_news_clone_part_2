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