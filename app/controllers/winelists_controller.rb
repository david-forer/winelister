class WinelistsController < ApplicationController

    #index route for all lists
    get '/winelists' do
        redirect_if_not_logged_in
        
            @winelists = Winelist.all.where(user_id: current_user.id)
            
            erb :'winelists/index'
        
    end

    #get winelists/new to create form 
    get '/winelists/new' do
    redirect_if_not_logged_in
        erb :'/winelists/new'
    
    end
    #post request to create a list
    post '/winelists' do
        redirect_if_not_logged_in

        if params[:description] != ""

            @winelist = Winelist.create(wine_name: params[:wine_name], user_id: current_user.id, description: params[:description])
            flash[:message] = "Your wine list was created" 
            redirect "winelists/#{@winelist.id}"
        else
            flash[:message] = "The wine list was not created. Please try again!"
            redirect '/winelists/new'
        end
    end
    
    #show page for wine list
    get '/winelists/:id' do
        @winelist = Winelist.find(params[:id])
        @user = User.find_by(id: session[:user_id])

        if @winelist && @winelist.user == current_user
        erb :'/winelists/show'
        # only_see_own_page 
        else
            flash[:message] = "you can only view your own lists"
            redirect '/winelists'
            
        end
       
        
    end

    post '/winelists/:id' do
        redirect_if_not_logged_in

        if params[:wine] != ""

            @winelist_btm = Winelist.create(wine: params[:wine], wine_type: params[:wine_type], year: params[:year], id: params[:id])
            flash[:message] = "Your wine was added to the list" if @winelist_btm.id
            redirect "winelists/#{@id}"
        else
            flash[:message] = "Your wine was not created. Please try again!"
            redirect '/winelists/new'
        end
    end

#     get '/winelists/:id/wines' do
#     "Hello World"
#   end


    private

    def only_see_own_page
         @user = User.find_by(params[:id])

        if current_user != @user
            redirect '/winelists', flash[:message] = "Sorry, but you are only allowed to view your own lists."

        else
         erb :'/winelists/show'
            
        end
    end

end