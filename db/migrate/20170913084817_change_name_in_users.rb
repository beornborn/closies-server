class ChangeNameInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :first_name, :full_name
    remove_column :users, :last_name, :string
  end
end
