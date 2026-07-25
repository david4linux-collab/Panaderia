class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :status, null: false, default: "pending"
      t.decimal :total, null: false, precision: 10, scale: 2, default: 0
      t.text :notes

      t.timestamps
    end
    add_index :orders, :status
    add_index :orders, :created_at
  end
end
