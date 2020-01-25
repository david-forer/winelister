class AddWineRatingToWinereviews < ActiveRecord::Migration
  def change
    add_column :winereviews, :wine_rating, :integer
  end
end
