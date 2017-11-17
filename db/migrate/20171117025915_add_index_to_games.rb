class AddIndexToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :slug, :string
    add_index :games, :slug
  end
end
