class RemoveColorFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :color, :string
  end
end
