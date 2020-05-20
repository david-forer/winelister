class WinereviewsController < ApplicationController

    get '/winereviews' do
        
        @winereviews = Winereview.all
        erb :'winereviews/index'
    end
    
    
    #get wine reviews/new to create form 
    get '/winereviews/new' do
        redirect_if_not_logged_in
        erb :'/winereviews/new'

    end
    #post request to create a review
    post '/winereviews' do
        
       redirect_if_not_logged_in

        if params[:wine_notes] != ""

            @winereview = current_user.winereviews.create(wine_notes: params[:wine_notes], wine_name: params[:wine_name], wine_rating: params[:wine_rating])
           
            # @winereview = Winereview.create(wine_notes: params[:wine_notes], user_id: current_user.id, wine_name: params[:wine_name],wine_rating: params[:wine_rating])
            flash[:message] = "Your wine Review was successfully created." if @winereview.id
            redirect "/winereviews/#{@winereview.id}"
        else 
            flash[:message] = "The Review didn't Work!! Boo, let's try again?!"
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
            flash[:message] = "You can't edit another user's wine review"
            redirect "users/#{current_user.id}"
        end   
    end

    patch '/winereviews/:id' do
        redirect_if_not_logged_in
        # 1. find the review entry
        @winereview = Winereview.find(params[:id])
        if @winereview.user == current_user && params[:wine_notes] != ""
        # 2. modify (update) the review
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
            flash[:message] = "Successfully deleted that wine review."
            redirect '/winereviews'
        else
            flash[:message] = "You can't delete another user's wine review"
            redirect '/winereviews'
        end

    end

    
    #index route for all reviews

#  figure out how to add to line 47 -> ,wine_name: params[:wine_name]




end