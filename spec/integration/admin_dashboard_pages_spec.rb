describe 'Admin dashboard pages' do

  let(:admin) { FactoryGirl.create(:admin_user) }

  before do 
    visit root_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Login'
  end

  subject { page }
  
  it { should have_content('CuReM') }
  it { should have_content('Dashboard') }

end