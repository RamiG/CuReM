module DeliveriesHelper

  def fill_in_delivery_controls(delivery)
    fill_in 'Title', with: delivery.title
    fill_in 'Message text', with: delivery.message_text
    select delivery.message_type, from: 'delivery_message_type'
    select delivery.delivery_rate, from: 'delivery_delivery_rate'
    fill_in 'Next delivery date', with: delivery.next_delivery_date.strftime('%F')
    fill_in 'Next delivery time', with: delivery.next_delivery_time.strftime('%H:%M')
  end

end