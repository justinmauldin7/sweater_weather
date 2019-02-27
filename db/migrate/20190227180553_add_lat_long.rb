class AddLatLong < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :latitude, :string
    add_column :favorites, :longitude, :string
  end
end
