describe Message do
  let(:message) { FactoryGirl.create(:message) }

  subject { message }

  it { should be_valid }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:message_type) }
  it { should validate_presence_of(:deliver_date) }
  it { should validate_presence_of(:deliver_time) }
  it { should respond_to(:message_text) }
end