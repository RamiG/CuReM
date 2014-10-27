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

    context 'view сlient' do
      before { click_link(client2.id, href: admin_client_path(client2)) }

      it { should have_css('#page_title', text: client2.full_name) }
      it { should have_css('tr', text: client2.first_name) }
      it { should have_css('tr', text: client2.last_name) }
      it { should have_css('tr', text: client2.birthdate.strftime('%B %d, %Y')) }
      it { should have_css('tr', text: client2.email) }
      it { should have_css('tr', text: client2.phone) }
      it { should have_css('tr', text: client2.terms_accepted) }
    end

    context 'edit client' do
      let(:update_client) { FactoryGirl.build(:client) }

      before do
        click_link('Edit', href: edit_admin_client_path(client1))
        fill_in_client_controls(update_client)
        click_button 'Update Client'
      end

      subject { client1.reload }

      its(:first_name) { should eq(update_client.first_name) }
      its(:last_name) { should eq(update_client.last_name) }
      its(:birthdate) { should eq(update_client.birthdate) }
      its(:email) { should eq(update_client.email) }
      its(:phone) { should eq(update_client.phone) }
      its(:terms_accepted) { should eq(update_client.terms_accepted) }
    end

    context 'delete client' do
      before { click_link('Delete', href: admin_client_path(client3)) }

      it 'should delete client' do
        expect { client3.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  context 'new client' do
    let(:new_client) { FactoryGirl.build(:client) }

    before do
      visit new_admin_client_path
      fill_in_client_controls(new_client)
      click_button 'Create Client'
    end

    it 'should create new client' do
      expect(page).to have_css('div.flash_notice')
      expect(Client.count).to eq(4)
    end
  end
end