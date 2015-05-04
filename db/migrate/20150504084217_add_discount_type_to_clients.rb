class AddDiscountTypeToClients < ActiveRecord::Migration
  def change
    add_column :clients, :discount_type_id, :integer, index: true
  end
end
