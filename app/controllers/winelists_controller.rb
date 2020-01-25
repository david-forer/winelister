class WinelistsController < ApplicationController

    #index route for all lists
    get '/winelists' do
        redirect_if_not_logged_in
            @winelists = Winelist.all
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
            flash[:message] = "Your wine list was created" if @winelist.id
            redirect "winelists/#{@winelist.id}"
        else
            flash[:message] = "The wine list was not created. Please try again!"
            redirect '/winelists/new'
        end
    end
    #show page for wine list
    get '/winelists/:id' do
        @winelist = Winelist.find(params[:id])
        erb :'/winelists/show'
        # only_see_own_page

       
        
    end


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