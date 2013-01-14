class CreateGiftSelecteds < ActiveRecord::Migration
  def self.up
    create_table :gift_selecteds do |t|
      t.integer :gift_receiver_id
      t.string :asin
      t.string :imgurl
      t.string :title
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :gift_selecteds
  end
end
