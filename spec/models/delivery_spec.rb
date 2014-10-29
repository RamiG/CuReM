describe Delivery do
  let(:delivery) { FactoryGirl.create(:delivery) }

  subject { delivery }

  it { should be_valid }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:message_type) }
  it { should validate_presence_of(:delivery_rate) }
  it { should validate_presence_of(:next_delivery_date) }
  it { should validate_presence_of(:next_delivery_time) }
  it { should respond_to(:message_text) }
  it { should respond_to(:state) }
end