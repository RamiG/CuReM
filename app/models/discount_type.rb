class DiscountType < ActiveRecord::Base
  validates :rate, :name, presence: true
end
