class ChangeDataTypeForShiftDate < ActiveRecord::Migration
  def self.up
    change_table :shifts do |t|
      t.change :date, :date
    end
  end

  def self.down
    change_table :shifts do |t|
      t.change :date, :datetime
    end
  end
end
