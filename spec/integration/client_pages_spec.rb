describe 'Client pages' do

  let(:admin) { FactoryGirl.create(:admin_user) }
  let(:client1) { FactoryGirl.create(:client) }
  let(:client2) { FactoryGirl.create(:client) }
  let(:client3) { FactoryGirl.create(:client) }

  before do
    visit root_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Login'
  end

  subject { page }

  it { should have_content('Clients') }
end