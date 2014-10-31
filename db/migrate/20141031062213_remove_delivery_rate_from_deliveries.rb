class RemoveDeliveryRateFromDeliveries < ActiveRecord::Migration
  def up
    remove_column :deliveries, :delivery_rate
  end

  def down
    add_column :deliveries, :delivery_rate, :string
  end
end
