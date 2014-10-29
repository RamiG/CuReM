ActiveAdmin.register Delivery do
  permit_params :title, :message_type, :message_text, :delivery_type, :next_delivery_date, :next_delivery_time, :state

  index do
    id_column
    column :title
    column :message_type
    column :deliver_date
    column :deliver_time do |r|
      r.deliver_time.strftime('%H:%M')
    end
    column :delivered
    actions
  end

  filter :title
  filter :message_type, as: :select, collection: Delivery::TYPES
  filter :deliver_date
  filter :deliver_time
  filter :delivered

  form do |f|
    f.inputs "Message Details" do
      f.input :title
      f.input :message_type, as: :select, collection: Delivery::TYPES
      f.input :message_text
      f.input :deliver_date, as: :datepicker
      f.input :deliver_time, as: :time_picker
      f.input :delivered
    end
    f.actions
  end

end
