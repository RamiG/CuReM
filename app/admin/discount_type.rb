ActiveAdmin.register DiscountType do
  permit_params :rate, :name

  index do
    id_column
    column :rate
    column :name
    actions
  end

  # show do |delivery|
  #   attributes_table do
  #     row :title
  #     row :message_type
  #     row :next_delivery_date
  #     row :next_delivery_time do
  #       delivery.next_delivery_time.strftime('%H:%M')
  #     end
  #     row :state
  #   end
  # end

  # filter :title
  # filter :message_type, as: :select, collection: Delivery::TYPES
  # filter :next_delivery_date
  # filter :next_delivery_time
  # filter :state

  # form do |f|
  #   f.inputs I18n.t(:details, model: Delivery.model_name.human, scope: 'active_admin') do
  #     f.input :title
  #     f.input :message_type, as: :select, collection: Delivery::TYPES
  #     f.input :message_text
  #     f.input :next_delivery_date, as: :datepicker
  #     f.input :next_delivery_time, as: :time_picker
  #   end
  #   f.actions
  # end

end
