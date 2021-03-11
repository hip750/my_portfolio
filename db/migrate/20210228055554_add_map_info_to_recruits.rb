class AddMapInfoToRecruits < ActiveRecord::Migration[5.2]
  def change
    add_column :recruits, :latitude, :float
    add_column :recruits, :longitude, :float
  end
end
