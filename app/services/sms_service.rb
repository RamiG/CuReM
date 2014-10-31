class SmsService
  def initialize(delivery)
    @delivery = delivery
  end

  def deliver_to(clients)
    clients.each { |client| send_sms_to(client) }
  end

  private

  def send_sms_to(client)
    twilio_client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
    twilio_client.account.sms.messages.create(
      from: TWILIO_CONFIG['from'],
      to: client.phone,
      body: @delivery.message_text
    )
  end
end