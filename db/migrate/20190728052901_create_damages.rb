class CreateDamages < ActiveRecord::Migration[5.2]
  def change
    create_table :damages do |t|
      t.string :title, null: false
      t.string :place, null: false
      t.text :descripition, null: false
      t.integer :amount
      t.timestamps
    end
  end
end
