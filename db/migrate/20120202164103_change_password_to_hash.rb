class ChangePasswordToHash < ActiveRecord::Migration
  def up
    rename_column :users, :pass, :password_hash
  end

  def down
    rename_column :users, :password_hash, :pass
  end
end
