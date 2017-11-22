class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

    add_index :users, :username
    add_index :users, :email
  end
end
