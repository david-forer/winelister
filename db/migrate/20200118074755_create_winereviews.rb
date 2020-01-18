class CreateWinereviews < ActiveRecord::Migration
  def change
    create_table :winereviews do |t|
      t.string :wine_name
      t.string :wine_notes
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
