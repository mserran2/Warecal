class ChangeUsertoUsername < ActiveRecord::Migration
  def up
    rename_column :users, :user, :username
  end

  def down
    rename_column :users, :username, :user
  end
end
