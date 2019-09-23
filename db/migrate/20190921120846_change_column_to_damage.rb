class ChangeColumnToDamage < ActiveRecord::Migration[5.2]
  def change
    change_column_null :damages, :latitude, false, 0
    change_column_null :damages, :longitude, false, 0
  end
end
