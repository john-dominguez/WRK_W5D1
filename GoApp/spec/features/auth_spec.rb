require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "New user"
  end

  feature 'signing up a user' do

    before(:each) do
      visit new_user_url
      fill_in 'Username', with: "Link"
      fill_in 'Password', with: "startrek"
      click_on "Create Account"
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content "Link"
      expect(page).not_to have_content "Create Account"
      expect(current_path).to eq('/goals')
    end

    scenario "redirect to new user page after signup" do

    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    fill_in 'Username', :with => "biscuits"
    fill_in 'Password', :with => "thebis"
    click_on "Log In"
  end
  scenario 'redirect to goals_url'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
