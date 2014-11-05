module ClientsHelper

  def fill_in_client_controls(client)
    fill_in Client.human_attribute_name(:first_name), with: client.first_name
    fill_in Client.human_attribute_name(:last_name), with: client.last_name
    select client.birthdate.year, from: 'client_birthdate_1i'
    select I18n.l(client.birthdate, format: '%B'), from: 'client_birthdate_2i'
    select client.birthdate.day, from: 'client_birthdate_3i'
    fill_in Client.human_attribute_name(:email), with: client.email
    fill_in Client.human_attribute_name(:phone), with: client.phone

    terms_method = client.terms_accepted? ? :check : :uncheck
    send(terms_method, 'client_terms_accepted')
  end

end