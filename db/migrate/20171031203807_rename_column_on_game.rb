class RenameColumnOnGame < ActiveRecord::Migration[5.1]
  def change
    rename_column :games, :name, :title
  end
end
