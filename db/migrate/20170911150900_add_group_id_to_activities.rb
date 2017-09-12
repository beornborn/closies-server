class AddGroupIdToActivities < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :user_in_group, index: true
    remove_column :activities, :user_id, :integer, index: true
    remove_column :activities, :color, :string
  end
end
