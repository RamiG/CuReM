class ClientMailer < ActionMailer::Base
  default from: "from@example.com"

  def ads_email(client, delivery)
    @client = client
    @delivery = delivery
    mail(to: client.email, subject: delivery.title)
  end
end
