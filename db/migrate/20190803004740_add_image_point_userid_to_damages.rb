class AddImagePointUseridToDamages < ActiveRecord::Migration[5.2]
  def change
    add_column :damages, :image, :string
    add_column :damages, :point, :string
    add_column :damages, :user_id, :integer
  end
end
