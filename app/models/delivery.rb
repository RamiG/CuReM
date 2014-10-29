class Delivery < ActiveRecord::Base
  TYPES = %i(email sms)
  RATES = %i(daily weekly monthly)

  validates_presence_of :title, :message_type, :delivery_rate, :next_delivery_date, :next_delivery_time

  after_create :perform_deliveries

  private

  def perform_deliveries
    clients = Client.all
    mailing_service = MailingService.new(self)
    mailing_service.deliver_to(clients)
  end
end