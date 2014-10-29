class MailingService
  def initialize(delivery)
    @delivery = delivery
  end

  def deliver_to(clients)
    clients.each { |client| email_for(client).deliver! }
  end

  private

  def email_for(client)
    ClientMailer.ads_email(client, @delivery)
  end
end