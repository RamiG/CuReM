class Delivery < ActiveRecord::Base
  extend Enumerize

  TYPES = %i(email sms)

  validates_presence_of :title, :message_type, :next_delivery_date, :next_delivery_time

  enumerize :message_type, in: TYPES, predicates: true

  scope :scheduled, -> { where(state: :scheduled) }

  state_machine :state, initial: :scheduled do
    event :perform do
      transition :scheduled => :delivered
    end
  end

  def perform
    clients = Client.all
    service = self.email? ? MailingService.new(self) : SmsService.new(self)
    service.deliver_to(clients)
    super
  end
end