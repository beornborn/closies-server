class CreateUserInGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_in_groups do |t|
      t.references :user, index: true
      t.references :group, index: true
      t.string :color

      t.timestamps
    end
  end
end
