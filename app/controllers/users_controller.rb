class UsersController < ApplicationController

    get '/login' do
        erb :login

    end

    post '/login' do
        #find the user
        @user = User.find_by(email: params[:email])
        #authenticate the user
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            puts session
            flash[:message] = "Welcome Back!"
            redirect "users/#{@user.id}!"
            
        else
            flash[:errors] = "Username or password is incorrect"
            redirect '/login'
            
        end
        
    end


    get '/signup' do
        erb :signup
    end

    post '/users' do

        if params[:name] != "" && params[:email] != "" && params[:password] != ""

        @user = User.create(params) #create user
        session[:user_id] = @user.id #login new created user

        redirect "/users/#{@user.id}"
        else
            flash[:message] = "Fill out all fields. Email can't be taken."
            redirect '/signup'
        end
    end

    get '/users/:id' do

        @user = User.find_by(id: params[:id])

        #redirect_if_not_logged_in

        erb :'/users/show'

    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end