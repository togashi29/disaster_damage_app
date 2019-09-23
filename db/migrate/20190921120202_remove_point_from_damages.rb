class RemovePointFromDamages < ActiveRecord::Migration[5.2]
  def change
    remove_column :damages, :point, :string
  end
end
