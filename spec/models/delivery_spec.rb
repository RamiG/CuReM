describe Delivery do
  let(:delivery) { FactoryGirl.build(:delivery) }

  subject { delivery }

  it { should be_valid }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:message_type) }
  it { should validate_presence_of(:delivery_rate) }
  it { should validate_presence_of(:next_delivery_date) }
  it { should validate_presence_of(:next_delivery_time) }
  it { should respond_to(:message_text) }
  it { should respond_to(:state) }
  its(:state) { should eq('scheduled') }

  describe '.scheduled_emails' do
    let!(:sms_delivery) { FactoryGirl.create(:delivery, message_type: :sms) }
    let!(:email_delivery) { FactoryGirl.create(:delivery, message_type: :email) }
    let!(:delivered_delivery) { FactoryGirl.create(:delivery, message_type: :email, state: :delivered) }

    it 'should return scheduled emails deliveries' do
      expect(described_class.scheduled_emails).to eq([email_delivery])
    end
  end

  describe '#perform' do
    let!(:client) { FactoryGirl.create(:client) }

    before { delivery.send(:perform) }

    it 'should deliver email to each client' do
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it 'should change delivery state to delivered' do
      expect(delivery.state).to eq('delivered')
    end

    describe 'delivered email' do
      subject { ActionMailer::Base.deliveries.last }

      its(:subject) { should eq(delivery.title) }
      its(:to) { should eq([client.email]) }
    end
  end
end