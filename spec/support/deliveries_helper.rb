module DeliveriesHelper

  def fill_in_delivery_controls(delivery)
    fill_in Delivery.human_attribute_name(:title), with: delivery.title
    fill_in Delivery.human_attribute_name(:message_text), with: delivery.message_text
    select delivery.message_type, from: 'delivery_message_type'
    fill_in Delivery.human_attribute_name(:next_delivery_date), with: delivery.next_delivery_date.strftime('%F')
    fill_in Delivery.human_attribute_name(:next_delivery_time), with: delivery.next_delivery_time.strftime('%H:%M')
  end

end