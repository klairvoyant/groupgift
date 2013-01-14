class CreateGiftGroups < ActiveRecord::Migration
  def self.up
    create_table :gift_groups do |t|
      t.integer :gift_receiver_id
      t.string :email
      t.integer :shareamount
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :gift_groups
  end
end
