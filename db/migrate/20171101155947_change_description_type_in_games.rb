class ChangeDescriptionTypeInGames < ActiveRecord::Migration[5.1]
  def change
    change_column :games, :description, :text
  end
end
