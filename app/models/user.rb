class User < ActiveRecord::Base 

    has_secure_password


    has_many :winelists
    has_many :winereviews

end
