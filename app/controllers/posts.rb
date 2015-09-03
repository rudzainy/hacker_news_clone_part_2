get '/new_post' do

	@title = ""
	@link = ""
	@content = ""
	erb :new_post
end

post '/new_post' do

	if session[:user_id]
		@title = params[:title]
		@link = params[:link]
		@content = params[:content]
		current_user

		if @link != "" and @content != ""
			@flash = "Please include either url OR text!"
			erb :new_post
		else
			@new_post = Post.create(title: @title, link: @link, content: @content, user_id: @current_user.id)
			@flash = "New post created successfully!"
			erb :index
		end

	else
		@flash = "Please log in or sign up to submit new post."
		erb :login
	end
end

get '/view_post/:id' do

	current_user
	@post = Post.find(params[:id])
	erb :view_post
end

get '/user_posts/:id' do

	@post = Post.where(user_id: params[:id])
	erb :user_posts
end