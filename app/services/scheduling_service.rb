require 'rufus-scheduler'

class SchedulingService
  def generate
    scheduler.at_jobs.each { |job| scheduler.unschedule(job) }

    deliveries = Delivery.scheduled_emails
    deliveries.each do |delivery|
      moment =  delivery.next_delivery_date.strftime('%F')
      moment << delivery.next_delivery_time.strftime(' %H:%M')
      scheduler.at moment do
        delivery.perform
      end
    end
  end

  private

  def scheduler
    Rufus::Scheduler.singleton
  end
end