require 'rails_helper'

RSpec.describe 'User can logout', type: :feature do
  scenario 'they see the option to logout when logged in' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    within('.nav-bar-primary') do
      expect(page).to have_link('Logout')
      expect(page).not_to have_link('Login')
    end
  end

  scenario 'they see a helpful message once logged out' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path
    click_link 'Logout'

    within('.flash-success') do
      expect(page).to have_content('Come back soon!')
    end
  end

  scenario 'the session is cleared' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path
    click_link 'Logout'

    expect{ 
      page.get_rack_session_key('user_id')
    }.to raise_error(KeyError, 'key not found: "user_id"')
  end
end
