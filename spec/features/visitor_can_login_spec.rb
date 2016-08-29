require 'rails_helper'

RSpec.describe 'Visitor can log in', type: :feature do
  scenario 'and they can login with their email' do
    user = create(
      :user,
      username: 'fancy_pants2',
      password: 'password'
    )
    visit login_path

    fill_in 'session[username]', with: 'fancy_pants2'
    fill_in 'session[password]', with: 'password'
    click_button 'Login'

    expect(page).to have_content('Successfully logged in!')
  end
end
