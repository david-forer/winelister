class Winereview < ActiveRecord::Base
    
    def time_created_at
        self.created_at.strftime("%A, %d %b %Y %l:%M %p")
    end

    belongs_to :user
end
