require 'rails_helper'

RSpec.describe 'User can login w/ their Foursquare account', type: :feature do
  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:foursquare] = OmniAuth::AuthHash.new({
      provider: 'foursquare',
      uid: '1234',
      info: {
        name: 'Horace'
      },
      extra: {
        raw_info: {
          contact: {
            email: 'pizza@gmail.com'
          },
          homeCity: 'Denver, CO'
        }
      },
      credentials: {
        token: 'pizza'
      }
    })
  end

  scenario 'they are redirected to root after logging in' do

    visit root_path
    
    click_link 'Login'

    expect(root_path).to eq(current_path)
    expect(page).to have_link('Logout')
  end
end
