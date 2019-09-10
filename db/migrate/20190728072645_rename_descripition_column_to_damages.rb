class RenameDescripitionColumnToDamages < ActiveRecord::Migration[5.2]
  def change
    rename_column :damages, :descripition, :description
  end
end
