module ClientsHelper

  def fill_in_client_controls(client)
    fill_in 'First name', with: client.first_name
    fill_in 'Last name', with: client.last_name
    select client.birthdate.year, from: 'client_birthdate_1i'
    select client.birthdate.strftime('%B'), from: 'client_birthdate_2i'
    select client.birthdate.day, from: 'client_birthdate_3i'
    fill_in 'Email', with: client.email
    fill_in 'Phone', with: client.phone

    terms_method = client.terms_accepted? ? :check : :uncheck
    send(terms_method, 'Terms accepted')
  end

end