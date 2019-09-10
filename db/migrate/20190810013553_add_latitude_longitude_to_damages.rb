class AddLatitudeLongitudeToDamages < ActiveRecord::Migration[5.2]
  def change
    add_column :damages, :latitude, :float
    add_column :damages, :longitude, :float
  end
end
