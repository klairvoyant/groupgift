class PaymentsReceived < ActiveRecord::Migration
  def self.up
    remove_column :payments, :payed
    add_column :payments, :payed, :float
  end

  def self.down
  end
end
