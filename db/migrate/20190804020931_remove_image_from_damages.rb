class RemoveImageFromDamages < ActiveRecord::Migration[5.2]
  def change
    remove_column :damages, :image, :string
  end
end
