class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :image
      t.decimal9 :price
      t.decimal2 :price
      t.boolean :active

      t.timestamps
    end
  end
end
