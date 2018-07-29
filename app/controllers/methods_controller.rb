class MephodsController < ApplicationController
require 'pry'
  get '/methods' do
    if logged_in?
      @mephod = Mephod.all
      erb :'/methods/browse_methods'
    else
      redirect to '/login'
    end
  end

	get '/methods/new' do
    	if logged_in?
    	  erb :'methods/new_method'
   		else
    	  redirect to '/login'
    	end
	end
	post '/create' do
      		@mephod = Mephod.new(:mephodname => params[:name], :language =>params[:language], :description => params[:description],:mephod_data =>params[:mephod_data])
      		@mephod.user_id=current_user.id
      		@mephod.tag=""
      		Tag.all.each do |t|
      			if params[:"#{t.name}"]!=nil
    	  			@mephod.tag << params[:"#{t.name}"] + " "
      			end
      		end
      		@mephod.tag.strip
      		@mephod.save
     		redirect to '/methods'
 	end 
  
  post '/edit/:id' do
  			@mephod= Mephod.find(params[:id])
      		@mephod.mephodname = params[:name]
      		@mephod.description = params[:description]
      		@mephod.mephod_data = params[:mephod_data]
      		@mephod.user_id=current_user.id
      		@mephod.tag=""
      		Tag.all.each do |t|
      			if params[:"#{t.name}"]!=nil
    	  			@mephod.tag << params[:"#{t.name}"] + " "
      			end
      		end
      		@mephod.tag.strip
      		@mephod.save
     		redirect to '/methods'
 	end 

  get '/methods/:slug' do
    if logged_in?
      @mephod = Mephod.find_by_slug(params[:slug])
      @user=User.find(@mephod.user_id)
      if @user==current_user
      	@editable="visible"
      else 
      	@editable="invisible"
      end
      erb :'methods/show_method'
    else
      redirect to '/login'
    end
  end

  get '/methods/:slug/edit' do
    if logged_in?
      @mephod = Mephod.find_by_slug(params[:slug])
      @user=User.find(@mephod.user_id)
      if  @user == current_user
        erb :'methods/edit_method'
      else
        redirect to '/methods'
      end
    else
      redirect to '/login'
    end
  end

 

  

  post '/delete/:id' do
    if logged_in?
      @mephod = Mephod.find(params[:id])
      if @mephod && @mephod.user == current_user
        @mephod.delete
      end
      erb :'/users/user_home'
    else
      redirect to '/login'
    end
  end

end
