class UsersController < ApplicationController

    get '/login' do
        erb :login

    end

    post '/login' do
        #find the user
        @user = User.find_by(email: params[:email])
        #authenticate the user
        if @user.authenticate(params[:password])
            session[:user_id] = @user_id 
            redirect "users/#{@user.id}"
        else
            
        end
        
    end

    get '/users/:id' do 
        "user show route"
    end

    get '/signup' do

    end
end