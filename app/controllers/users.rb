get '/login' do

	@login_name = ""
	@signup_name = ""
	@email = ""

	erb :login
end

post '/login' do

	@login_name = params[:name]
	@password = params[:password]

	if User.authenticate(@login_name, @password)
		session[:user_id] = User.find_by(name: @login_name).id
		current_user
		@flash = "Welcome hack #{@current_user.name}!"
		erb :index
	else
		@flash = "Invalid username or password!"
		erb :login
	end
end

post '/signup' do

	@signup_name = params[:name]
	@email = params[:email]
	@password = params[:password]
	@new_user = User.new(name: @signup_name, email: @email, password: @password)
	
	@new_user.save
	if @new_user.save
		@flash = "Account successfully created! You may log in now."
		@signup_name = ""
		@email = ""
	else
		@flash = @new_user.errors.messages
	end
	erb :login
end

get '/user_profile/:id' do

	current_user
	@user = User.find(params[:id])
	if @current_user.id == @user.id
		erb :edit_profile
	else
		erb :user_profile
	end
end

get '/logout' do

	session[:user_id] = nil
	@flash = "You have successfulley logged out."
	erb :index
end

post '/edit_profile' do
	
	current_user
	@about = params[:about]
	@email = params[:email]
	@current_user.update(about: @about, email: @email)
	
	@flash = "Your profile has been updated!"
	erb :edit_profile
end








