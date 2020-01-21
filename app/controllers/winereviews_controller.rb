class WinereviewsController < ApplicationController

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
        @winereview = Winereview.create(wine_notes: params[:wine_notes], user_id: current_user.id, )
        redirect "/winereviews/#{@winereview.id}"
    else 
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
    erb :'/winereviews/edit'
  end

#index route for all reviews

end