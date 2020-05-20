class AddWineAndYearToWinelists < ActiveRecord::Migration
    def change
      add_column :winelists, :wine, :string
      add_column :winelists, :wine_type, :string
      add_column :winelists, :year, :integer
    end
end
