RSpec.describe ClientMailer, :type => :mailer do
  describe 'ads_email' do
    let(:client) { FactoryGirl.create(:client) }
    let(:delivery) { FactoryGirl.create(:delivery) }
    let(:mail) { described_class.ads_email(client, delivery) }

    subject { mail }

    its(:subject) { should eq(delivery.title) }
    its(:to) { should eq([client.email]) }
    its(:from) { should eq(['from@example.com']) }
    its(:body) { should match(client.full_name) }
    its(:body) { should match(delivery.message_text) }
  end
end
