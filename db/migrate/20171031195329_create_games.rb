class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.date :release_date
      t.integer :developer_id
      t.integer :publisher_id

      t.timestamps
    end
  end
end
