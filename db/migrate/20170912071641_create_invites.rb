class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.string :token, index: true
      t.references :user
      t.references :group

      t.timestamps
    end
  end
end
