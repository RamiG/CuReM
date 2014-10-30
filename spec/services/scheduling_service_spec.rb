describe SchedulingService do
  let(:service) { SchedulingService.new }

  describe '#generate' do
    let!(:delivery1) { FactoryGirl.create(:delivery) }
    let!(:delivery2) { FactoryGirl.create(:delivery) }

    it 'should schedule email deliveries' do
      expect { service.generate }.to change { Rufus::Scheduler.singleton.at_jobs.count }.by(2)
    end
  end

  describe '#scheduler' do
    specify { expect(service.send(:scheduler)).to eq(Rufus::Scheduler.singleton) }
  end
end