ActiveAdmin.register Client do
  permit_params :first_name, :last_name, :birthdate, :email, :phone, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :birthdate
    column :email
    column :phone
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Client Details" do
      f.input :first_name
      f.input :last_name
      f.input :birthdate
      f.input :email
      f.input :phone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
