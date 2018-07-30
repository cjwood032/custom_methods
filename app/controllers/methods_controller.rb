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
	    	if params[:name] == "" || params[:mephod_data] == "" || params[:description] == ""|| params[:language] ==""
	    		
	      		erb :'methods/new_method', locals: {message: "You need to fill out the form completely."}
	      	else
	      		redirect to '/createmethod'
	      	end
	end
	get '/createmethod' do      	
		@mephod = current_user.mephods.build(:mephodname => params[:name], :language =>params[:language], :description => params[:description],:mephod_data =>params[:mephod_data])
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

 get "/search" do
 	@st=""
 	@viewable="invisible"
 	@results=Hash.new(0)
 	erb :'methods/search'
 end

  post '/search' do
  	@st=params[:term]
  	@viewable="visible"
  	if params[:inlineRadioOptions]=="Name"
	  	@results=Mephod.all.select do|m,v|
	  			check=m.mephodname
	  			if m.mephodname !=nil
	  				check.include? params[:term] or check.include? params[:term].capitalize
	  			end
	  	end
  	end

  	if params[:inlineRadioOptions]=="Description"
	  	@results=Mephod.all.select do|m,v|
	  			check=m.description
	  			if m.description !=nil
	  				check.include? params[:term] or check.include? params[:term].capitalize
	  			end
	  	end
  	end
  	  	
  	if params[:inlineRadioOptions]=="Code"
	  	@results=Mephod.all.select do|m,v|
	  			check=m.mephod_data
	  			if m.mephod_data !=nil
	  				check.include? params[:term] or check.include? params[:term].capitalize
	  			end
	
	  	end
  	end
  	if params[:inlineRadioOptions]=="Language"
	  	@results=Mephod.all.select do|m,v|
	  			check=m.language
	  			if m.language !=nil
	  				check.include? params[:term] or check.include? params[:term].capitalize
	  			end
	  	end
  	end
   	erb :'methods/search'
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
