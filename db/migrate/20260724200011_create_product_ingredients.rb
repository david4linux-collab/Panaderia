class CreateProductIngredients < ActiveRecord::Migration[8.1]
  def change
    create_table :product_ingredients do |t|
      t.references :product, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :quantity, null: false, precision: 10, scale: 3

      t.timestamps
    end
    add_index :product_ingredients, [ :product_id, :ingredient_id ], unique: true
  end
end
