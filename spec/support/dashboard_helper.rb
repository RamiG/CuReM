module DashboardHelper
  def sign_in(admin)
    visit root_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Login'
    expect(page).to have_css('div.flash_notice')
  end

  def sign_out
    visit root_path
    click_link 'Logout'
    expect(page).to have_css('div.flash_notice')
  end
end