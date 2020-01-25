class Winelist < ActiveRecord::Base

    def time_created_at
        self.created_at.strftime("%A, %d %b %Y %l:%M %p")
    end

    # resources :users, only: [:show]
    belongs_to :user
end
