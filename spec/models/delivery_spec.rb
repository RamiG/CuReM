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

  describe 'callbacks' do
    it { should callback(:perform_deliveries).after(:create) }

    context '#perform_deliveries' do
      let!(:client) { FactoryGirl.create(:client) }

      before { subject.send(:perform_deliveries) }

      it 'should deliver email to each client' do
        expect(ActionMailer::Base.deliveries.count).to eq(1)
      end

      describe 'delivered email' do
        subject { ActionMailer::Base.deliveries.first }

        its(:subject) { should eq(delivery.title) }
        its(:to) { should eq([client.email]) }
      end
    end
  end
end