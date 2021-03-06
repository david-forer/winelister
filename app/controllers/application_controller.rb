require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "our_wine_listing_app"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
    erb :welcome
    end
  end

  get '/users/' do
    # puts "Hello world"
    # if logged_in?
    #   redirect "/users/#{user.id}"
    # else
    #   erb :'users/index'
    # end
  end

  helpers do

    def logged_in? 
      !!current_user
    end

    def current_user 
      @current_user = User.find_by(id: session[:user_id])
    end

    def authorized_to_edit?(winereview)
      winereview.user == current_user
    end

    # def also_authorized_to_edit?(winelist)
    #   winelist.user == current_user
    # end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:message] = "You must login to view this page"
        # flash[:errors] = "You must be logged in to view the page you tried to view."
        redirect '/'
      end
    end

  end

end
