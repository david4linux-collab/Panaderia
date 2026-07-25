class CreateIngredients < ActiveRecord::Migration[8.1]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.string :unit, null: false
      t.decimal :cost, null: false, precision: 10, scale: 2, default: 0
      t.decimal :stock, null: false, precision: 10, scale: 3, default: 0

      t.timestamps
    end
    add_index :ingredients, :name, unique: true
  end
end
