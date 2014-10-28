class Message < ActiveRecord::Base
  TYPES = %i(email sms)

  validates_presence_of :title, :message_type, :deliver_date, :deliver_time
end