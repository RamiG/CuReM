module DashboardHelper
  def sign_in(admin)
    visit root_path
    fill_in 'admin_user_email', with: admin.email
    fill_in 'admin_user_password', with: admin.password
    find(:xpath, '//input[@name="commit"]').click
    expect(page).to have_css('div.flash_notice')
  end

  def sign_out
    visit root_path
    click_link 'Logout'
    expect(page).to have_css('div.flash_notice')
  end
end