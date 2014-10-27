describe 'Client pages' do

  let(:admin) { FactoryGirl.create(:admin_user) }
  let!(:client1) { FactoryGirl.create(:client) }
  let!(:client2) { FactoryGirl.create(:client) }
  let!(:client3) { FactoryGirl.create(:client) }

  before { sign_in(admin) }

  subject { page }

  context 'index' do
    before { visit admin_clients_path }

    it { should have_css('#page_title', text: 'Clients') }
    it { should have_link(client1.id, href: admin_client_path(client1)) }
    it { should have_link(client2.id, href: admin_client_path(client2)) }
    it { should have_link(client3.id, href: admin_client_path(client3)) }

    context 'view lient' do
      before { click_link(client2.id, href: admin_client_path(client2)) }

      it { should have_css('#page_title', text: client2.full_name) }
      it { should have_css('tr', text: client2.first_name) }
      it { should have_css('tr', text: client2.last_name) }
      it { should have_css('tr', text: client2.birthdate.strftime('%B %d, %Y')) }
      it { should have_css('tr', text: client2.email) }
      it { should have_css('tr', text: client2.phone) }
      it { should have_css('tr', text: client2.terms_accepted) }
    end
  end

  context 'new client' do
    let(:new_client) { FactoryGirl.build(:client) }

    before do
      visit new_admin_client_path

      fill_in 'First name', with: new_client.first_name
      fill_in 'Last name', with: new_client.last_name
      select '1950', from: 'client_birthdate_1i'
      select 'March', from: 'client_birthdate_2i'
      select '19', from: 'client_birthdate_3i'
      fill_in 'Email', with: new_client.email
      fill_in 'Phone', with: new_client.phone
      check 'Terms accepted'
      click_button 'Create Client'
    end

    it 'should create new client' do
      expect(page).to have_css('div.flash_notice')
      expect(Client.count).to eq(4)
    end
  end
end