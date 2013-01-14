class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :gift_receiver_id
      t.integer :gift_group_id
      t.integer :payed
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
