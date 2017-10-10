class AddCheckedToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :checked, :integer, array: true, default: []
  end
end
