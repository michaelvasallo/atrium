class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :postal_code
      t.integer :province_id
      t.integer :user_id

      t.timestamps
    end
  end
end
