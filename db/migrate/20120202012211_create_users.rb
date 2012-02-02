class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phone
      t.string :user
      t.string :pass
      t.datetime :lastlog
      t.boolean :opt_out

      t.timestamps
    end
  end
end
