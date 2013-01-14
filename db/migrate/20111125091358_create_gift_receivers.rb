class CreateGiftReceivers < ActiveRecord::Migration
  def self.up
    create_table :gift_receivers do |t|
      t.string :name
      t.string :email
      t.string :occassion
      t.date :senddate

      t.timestamps
    end
  end

  def self.down
    drop_table :gift_receivers
  end
end
