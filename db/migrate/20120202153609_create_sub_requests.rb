class CreateSubRequests < ActiveRecord::Migration
  def change
    create_table :sub_requests do |t|
      t.integer :user_id
      t.integer :shift_id
      t.boolean :filled

      t.timestamps
    end
    add_index :sub_requests, :shift_id
    add_index :sub_requests, :user_id
  end
end
