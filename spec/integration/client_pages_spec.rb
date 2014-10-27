describe 'Client pages' do

  let(:admin) { FactoryGirl.create(:admin_user) }
  let!(:client1) { FactoryGirl.create(:client) }
  let!(:client2) { FactoryGirl.create(:client) }
  let!(:client3) { FactoryGirl.create(:client) }

  before do
    sign_in(admin)
    visit admin_clients_path
  end

  subject { page }

  describe 'index' do
    it { should have_css('#page_title', text: 'Clients') }
    it { should have_link(client1.id, href: admin_client_path(client1)) }
    it { should have_link(client2.id, href: admin_client_path(client2)) }
    it { should have_link(client3.id, href: admin_client_path(client3)) }
  end
end