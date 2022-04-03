class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :dni
      t.string :phone_number
      t.string :token
      t.timestamps

    end
    add_index :users, :token
    add_index :users, :email, unique: true
  end
end
