class CreateAssigments < ActiveRecord::Migration
  def change
    create_table :assigments do |t|
      t.integer :user_id
      t.integer :shift_id

      t.timestamps
    end
    add_index :assigments, :user_id
    add_index :assigments, :shift_id
  end
end
