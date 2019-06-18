require 'rails_helper'

RSpec.feature "User redirects to home page after successful login", type: :feature, js: true do

  # SETUP
  before :each do
    User.create!({
      first_name: 'Thomas',
      last_name: 'Anderson',
      email: 'thomas@gmail.com',
      password: 'abcde',
      password_confirmation: 'abcde'
    })
  end

  scenario "Users will see their names of navbar after login" do
    # ACT
    visit login_path
    fill_in 'email', with: 'thomas@gmail.com'
    fill_in 'password', with: 'abcde'
    click_on 'Login'

    #VERIFY
    expect(page).to have_content 'Thomas'

    # DEBUG
    # save_screenshot
  end

end
