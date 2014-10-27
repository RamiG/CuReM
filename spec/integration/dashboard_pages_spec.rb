describe 'Admin dashboard pages' do

  let(:admin) { FactoryGirl.create(:admin_user) }

  before { sign_in(admin) }

  subject { page }

  it { should have_content('CuReM') }
  it { should have_content('Dashboard') }

end