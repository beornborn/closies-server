class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
