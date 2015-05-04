ActiveAdmin.register Client do
  permit_params :first_name, :last_name, :birthdate, :email, :phone, :terms_accepted, :discount_type_id

  index do
    id_column
    column :first_name
    column :last_name
    column :birthdate
    column :email
    column :phone
    column :discount_type
    actions
  end

  filter :first_name
  filter :last_name
  filter :birthdate
  filter :email
  filter :phone
  filter :discount_type

  show title: proc { |client| client.full_name }

  form do |f|
    f.inputs I18n.t(:details, model: Client.model_name.human, scope: 'active_admin') do
      f.input :first_name
      f.input :last_name
      f.input :birthdate, start_year: 1950
      f.input :email
      f.input :phone
      f.input :discount_type
      f.input :terms_accepted
    end
    f.actions
  end

end
