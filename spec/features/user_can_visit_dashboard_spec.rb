require 'rails_helper'

RSpec.describe 'User can visit their dashboard', type: :feature do
  scenario 'and they can see they account information' do
    user = create(:user)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_user).and_return(user)

    visit dashboard_path

    within('#account-info') do
      expect(page).to have_content("username: #{user.username}")
      expect(page).to have_content("email: #{user.email}")
      expect(page).to have_content("phone: #{user.phone_number}")
    end
  end
end
