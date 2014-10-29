require_relative '20141028123925_create_messages'

class RenameMessagesToDeliveries < ActiveRecord::Migration
  def up
    drop_table :messages

    create_table :deliveries do |t|
      t.string   :title, null: false
      t.string   :message_type, null: false
      t.text     :message_text
      t.string   :delivery_rate, null: false
      t.date     :next_delivery_date, null: false
      t.time     :next_delivery_time, null: false
      t.string   :state
      t.timestamps
    end

    add_index :deliveries, :title
    add_index :deliveries, :message_type
    add_index :deliveries, :delivery_rate
    add_index :deliveries, :next_delivery_date
    add_index :deliveries, :state
  end

  def down
    drop_table :deliveries

    run CreateMessages
  end
end
