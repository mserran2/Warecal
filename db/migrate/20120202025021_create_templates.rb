class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :day
      t.integer :start
      t.integer :end

      t.timestamps
    end
  end
end
