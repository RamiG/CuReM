class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name,  null: false, default: ''
      t.date :birthdate
      t.string :email
      t.string :phone
      t.boolean :terms_accepted, default: false
      t.timestamps
    end

    add_index :clients, :first_name
    add_index :clients, :last_name
    add_index :clients, :birthdate
    add_index :clients, :email
    add_index :clients, :phone
  end
end
