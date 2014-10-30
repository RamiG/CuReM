require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton
scheduler.every '1m' do
  SchedulingService.new.generate
end