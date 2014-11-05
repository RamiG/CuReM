describe 'Admin dashboard pages' do

  let(:admin) { FactoryGirl.create(:admin_user) }

  before { sign_in(admin) }

  subject { page.find('div#header') }

  it { should have_css('h1', text: 'CuReM') }
  it { should have_link(I18n.t('dashboard', scope: 'active_admin')) }
  it { should have_link(Client.model_name.human(count: 2)) }
  it { should have_link(ActiveAdmin::Comment.model_name.human(count: 2)) }
  it { should have_link(Delivery.model_name.human(count: 2)) }
end