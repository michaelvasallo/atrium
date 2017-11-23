class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.decimal :price
      t.integer :order_id
      t.integer :game_id

      t.timestamps
    end
  end
end
