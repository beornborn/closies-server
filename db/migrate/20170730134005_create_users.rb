class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.text :picture
      t.string :locale
      t.string :facebook_id
      t.string :facebook_link
      t.string :auth_token

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :auth_token, unique: true
  end
end
