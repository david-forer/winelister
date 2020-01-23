class WinereviewsController < ApplicationController

    get '/winereviews' do
        @winereviews = Winereview.all
        erb :'winereviews/index'
    end
    
    
    #get wine reviews/new to create form 
    get '/winereviews/new' do
        erb :'/winereviews/new'

    end
    #post request to create a review
    post '/winereviews' do
        
        if !logged_in?
            redirect '/'
        end  

        if params[:wine_notes] != ""
            # flash[:message] = "[[The Review was Successfully created, Great Job!]]"
            @winereview = Winereview.create(wine_notes: params[:wine_notes], user_id: current_user.id, wine_name: params[:wine_name])
            flash[:message] = "Your wine Review was successfully created." if @winereview.id
            redirect "/winereviews/#{@winereview.id}"
        else 
            flash[:message] = "[[The Review didn't Work!! Boo, let's try again?!]]"
            redirect '/winereviews/new'

        end

    end

    #show page for winereviews
    get '/winereviews/:id' do
        @winereview = Winereview.find(params[:id])
        erb :'/winereviews/show'
    end
    # route to edit wine reviews
    get '/winereviews/:id/edit' do
        redirect_if_not_logged_in
        @winereview = Winereview.find(params[:id])
        if authorized_to_edit?(@winereview)
            erb :'/winereviews/edit'
        else 
            redirect "users/#{current_user.id}"
        end   
    end

    patch '/winereviews/:id' do
        redirect_if_not_logged_in
        # 1. find the journal entry
        @winereview = Winereview.find(params[:id])
        if @winereview.user == current_user && params[:wine_notes] != ""
        # 2. modify (update) the journal entry
        @winereview.update(wine_notes: params[:wine_notes])
        # 3. redirect to show page
        redirect "/winereviews/#{@winereview.id}"
        else
        redirect "users/#{current_user.id}"
        end
    end

    delete '/winereviews/:id' do
        @winereview = Winereview.find(params[:id])
        if authorized_to_edit?(@winereview)
            @winereview.destroy
            flash[:message] = "Successfully deleted that entry."
            redirect '/winereviews'
        else
            redirect '/winereviews'
        end

    end
    #index route for all reviews

#  figure out how to add to line 47 -> ,wine_name: params[:wine_name]




end