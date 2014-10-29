describe MailingService do
  let(:service) { MailingService.new(delivery) }
  let(:delivery) { FactoryGirl.create(:delivery) }
  let(:clients) { 3.times.collect { FactoryGirl.create(:client) } }

  describe '#deliver_to' do
    it 'should deliver ads email to all clients' do
      expect { service.deliver_to(clients) }.to change { ActionMailer::Base.deliveries.count }.by(3)
    end
  end

  describe '#email_for' do
    let(:client) { clients.first }
    let(:expected_email) { ClientMailer.ads_email(client, delivery) }

    it 'should generate the right mail' do
      expect(service.send(:email_for, client)).to eq(expected_email)
    end
  end
end