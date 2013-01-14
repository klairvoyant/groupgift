class NewFieldsGiftreceiver < ActiveRecord::Migration
  def self.up
    add_column :gift_receivers, :desc, :text
    add_column :gift_receivers, :coast, :integer
    add_column :gift_receivers, :imgurl, :string
  end

  def self.down
  end
end
