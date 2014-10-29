describe 'Admin dashboard pages' do

  let(:admin) { FactoryGirl.create(:admin_user) }

  before { sign_in(admin) }

  subject { page.find('div#header') }

  it { should have_css('h1', text: 'CuReM') }
  it { should have_link('Dashboard') }
  it { should have_link('Clients') }
  it { should have_link('Comments') }
  it { should have_link('Deliveries') }
end