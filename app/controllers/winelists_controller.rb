class WinelistsController < ApplicationController


 get '/winelists' do
        @winelists = Winelist.all
        erb :'winelists/index'
    end


#get winelists/new to create form 
get '/winelists/new' do
    erb :'/winelists/new'

end

get '/wine_lists' do
    erb :'/winelists/show'
  end
#post request to create a review
#show page for winereviews
#index route for all reviews

end