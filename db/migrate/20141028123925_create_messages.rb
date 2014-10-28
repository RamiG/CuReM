class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string   :title, null: false
      t.string   :message_type, null: false
      t.text     :message_text
      t.date     :deliver_date, null: false
      t.time     :deliver_time, null: false
      t.boolean  :delivered, null: false, default: false
      t.timestamps
    end

    add_index :messages, :title
    add_index :messages, :message_type
    add_index :messages, :deliver_date
    add_index :messages, :deliver_time
    add_index :messages, :delivered
  end
end
