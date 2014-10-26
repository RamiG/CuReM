describe Client do
  let(:client) { FactoryGirl.create(:client) }

  subject { client }

  it { should be_valid }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should respond_to(:email) }
  it { should respond_to(:phone) }
  it { should respond_to(:birthdate) }
  it { should respond_to(:terms_accepted) }
end