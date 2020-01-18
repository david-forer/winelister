class CreateWinelists < ActiveRecord::Migration
  def change
    create_table :winelists do |t|
      t.string :wine_name
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
