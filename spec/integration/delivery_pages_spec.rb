describe 'Delivery pages' do

  let(:admin) { FactoryGirl.create(:admin_user) }

  before { sign_in(admin) }

  subject { page }

  context 'index' do
    let!(:delivery1) { FactoryGirl.create(:delivery) }
    let!(:delivery2) { FactoryGirl.create(:delivery) }
    let!(:delivery3) { FactoryGirl.create(:delivery) }

    before { visit admin_deliveries_path }

    it { should have_css('#page_title', text: 'Deliveries') }
    it { should have_link(delivery1.id, href: admin_delivery_path(delivery1)) }
    it { should have_link(delivery2.id, href: admin_delivery_path(delivery2)) }
    it { should have_link(delivery3.id, href: admin_delivery_path(delivery3)) }

    context 'view delivery' do
      before { click_link(delivery2.id, href: admin_delivery_path(delivery2)) }

      it { should have_css('#page_title', text: delivery2.title) }
      it { should have_css('tr', text: delivery2.message_type) }
      it { should have_css('tr', text: delivery2.next_delivery_date.strftime('%B %d, %Y')) }
      it { should have_css('tr', text: delivery2.next_delivery_time.utc.strftime('%H:%M')) }
      it { should have_css('tr', text: delivery2.state) }
    end

    context 'edit delivery' do
      let(:update_delivery) { FactoryGirl.build(:delivery) }

      before do
        click_link('Edit', href: edit_admin_delivery_path(delivery1))
        fill_in_delivery_controls(update_delivery)
        click_button 'Update Delivery'
      end

      subject { delivery1.reload }

      its(:title) { should eq(update_delivery.title) }
      its(:message_type) { should eq(update_delivery.message_type.to_s) }
      its(:message_text) { should eq(update_delivery.message_text) }
      its(:next_delivery_date) { should eq(update_delivery.next_delivery_date) }
      its(:state) { should eq(update_delivery.state) }
      it 'should have correct next_delivery_time' do
        expect(subject.next_delivery_time.strftime('%H:%M')).to eq(update_delivery.next_delivery_time.strftime('%H:%M'))
      end
    end

    context 'delete delivery' do
      before { click_link('Delete', href: admin_delivery_path(delivery3)) }

      it 'should delete delivery' do
        expect { delivery3.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  context 'new delivery' do
    let(:new_delivery) { FactoryGirl.build(:delivery) }

    before do
      visit new_admin_delivery_path
      fill_in_delivery_controls(new_delivery)
      click_button 'Create Delivery'
    end

    it 'should create new delivery' do
      expect(page).to have_css('div.flash_notice')
      expect(Delivery.count).to eq(1)
    end
  end
end