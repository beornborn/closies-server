class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, index: true
      t.references :activity, index: true
      t.integer :checked, array: true, default: []

      t.timestamps
    end
  end
end
