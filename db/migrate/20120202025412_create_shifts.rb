class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :template_id
      t.datetime :date
      t.integer :start
      t.integer :end
      t.boolean :canceled

      t.timestamps
    end
    add_index :shifts, :template_id
  end
end
