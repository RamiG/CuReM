class Delivery < ActiveRecord::Base
  TYPES = %i(email sms)
  RATES = %i(daily weekly monthly)

  validates_presence_of :title, :message_type, :delivery_rate, :next_delivery_date, :next_delivery_time
end