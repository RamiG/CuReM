class CreateDiscountTypes < ActiveRecord::Migration
  def change
    create_table :discount_types do |t|
      t.integer :rate, null: false
      t.string :name, null: false, default: ''

      t.timestamps
    end
  end
end
