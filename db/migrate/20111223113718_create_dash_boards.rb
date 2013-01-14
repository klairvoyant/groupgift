class CreateDashBoards < ActiveRecord::Migration
  def self.up
    create_table :dash_boards do |t|
      t.integer :gift_receiver_id
      t.string :log_in_email

      t.timestamps
    end
  end

  def self.down
    drop_table :dash_boards
  end
end
