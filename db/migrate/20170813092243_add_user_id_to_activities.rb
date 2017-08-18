class AddUserIdToActivities < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :user
  end
end
