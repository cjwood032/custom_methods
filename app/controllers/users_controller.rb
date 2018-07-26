class UsersController < ApplicationController
	
	get '/signup' do
		if !logged_in?
			erb :'users/create_user', locals: {message: "You need to sign up!"}
		else
			redirect_to '/user_home'
		end
	end #end of the /signup
	get '/user_home' do
		erb :'users/user_home'
	end
	post '/signup' do
    	if params[:username] == "" || params[:email] == "" || params[:password] == ""
      		redirect to '/signup'
    	else
      		@user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
     		@user.save
      		session[:user_id] = @user.id
      		redirect to '/user_home'
    	end
  end #end post signup
  
  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/user_home'
    end
  end #end the login

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/user_home"
    else
      redirect to '/signup'
    end
  end #end the post
  
   get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end
 
  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end























end #end of the class
