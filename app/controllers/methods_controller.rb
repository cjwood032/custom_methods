class MephodsController < ApplicationController
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
	post '/methods/new' do
      		@mephod = Mephod.new(:name => params[:name], :language => params[:language], :description => params[:description], :mephod_data => params[:mephod_data], :tag => params[:tag])
     		@mephod.save
     		redirect to '/methods'
 	end #end post signup
  post '/methods' do
    if logged_in?
      if params[:content] == ""
        redirect to "/methods/new"
      else
        @method = current_user.mephods.build(content: params[:content])
        if @mephod.save(false)
          redirect to "/methods/#{@method.id}"
        else
          redirect to "/methods/new"
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/methods/:slug' do
    if logged_in?
      @mephod = Mephod.find_by_slug(params[:slug])
      erb :'methods/show_method'
    else
      redirect to '/login'
    end
  end

  get '/methods/:id/edit' do
    if logged_in?
      @mephod = Mephod.find_by_id(params[:id])
      if @mephod && @mephod.user == current_user
        erb :'methods/edit_method'
      else
        redirect to '/methods'
      end
    else
      redirect to '/login'
    end
  end

  patch '/methods/:id' do
    if logged_in?
      if params[:content] == ""
        redirect to "/methods/#{params[:id]}/edit"
      else
        @mephod = Mephod.find_by_id(params[:id])
        if @mephod && @mephod.user == current_user
          if @mephod.update(content: params[:content])
            redirect to "/methods/#{@mephod.id}"
          else
            redirect to "/methods/#{@mephod.id}/edit"
          end
        else
          redirect to '/methods'
        end
      end
    else
      redirect to '/login'
    end
  end

  

  delete '/methods/:id/delete' do
    if logged_in?
      @mephod = Mephod.find_by_id(params[:id])
      if @mephod && @mephod.user == current_user
        @mephod.delete
      end
      redirect to '/methods'
    else
      redirect to '/login'
    end
  end

end
