class Delivery < ActiveRecord::Base
  TYPES = %i(email sms)

  validates_presence_of :title, :message_type, :next_delivery_date, :next_delivery_time

  scope :scheduled_emails, -> { where(message_type: :email, state: :scheduled) }

  state_machine :state, initial: :scheduled do
    event :perform do
      transition :scheduled => :delivered
    end
  end

  def perform
    clients = Client.all
    mailing_service = MailingService.new(self)
    mailing_service.deliver_to(clients)
    super
  end
end