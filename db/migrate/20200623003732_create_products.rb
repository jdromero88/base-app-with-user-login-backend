class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :image
      t.decimal :price
      t.boolean :active

      t.timestamps
    end
  end
end
