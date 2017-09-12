class AddOwnerToUserInGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :user_in_groups, :owner, :boolean, default: false
  end
end
