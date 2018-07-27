class MethodsController < ApplicationController
  get '/methods' do
    if logged_in?
      @methods = Methods.all
      erb :'methods/methods'
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

  post '/methods' do
    if logged_in?
      if params[:content] == ""
        redirect to "/methods/new"
      else
        @method = current_user.methods.build(content: params[:content])
        if @method.save
          redirect to "/methods/#{@method.id}"
        else
          redirect to "/methods/new"
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/methods/:id' do
    if logged_in?
      @method = Method.find_by_id(params[:id])
      erb :'methods/show_method'
    else
      redirect to '/login'
    end
  end

  get '/methods/:id/edit' do
    if logged_in?
      @method = Method.find_by_id(params[:id])
      if @method && @method.user == current_user
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
        @method = Method.find_by_id(params[:id])
        if @method && @method.user == current_user
          if @method.update(content: params[:content])
            redirect to "/methods/#{@method.id}"
          else
            redirect to "/methods/#{@method.id}/edit"
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
      @method = Method.find_by_id(params[:id])
      if @method && @method.user == current_user
        @method.delete
      end
      redirect to '/methods'
    else
      redirect to '/login'
    end
  end

end
