class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.decimal :discount
      t.date :release_date
      t.string :slug
      t.string :image
      t.string :video
      t.integer :developer_id
      t.integer :publisher_id

      t.timestamps
    end
  end
end
