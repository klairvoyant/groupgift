class ChangeCoastInteger < ActiveRecord::Migration
  def self.up
    remove_column :gift_receivers, :coast
    add_column :gift_receivers, :coast, :float
  end

  def self.down
  end
end
