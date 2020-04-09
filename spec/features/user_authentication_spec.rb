require 'rails_helper'

RSpec.feature "Authentication", type: :feature do
  def sign_up_and_logout
    visit "/posts"
    click_link "Sign Up!"
    fill_in "user_name", with: "Tester"
    fill_in "user_email", with: "tester@mail.com"
    fill_in "user_password", with: "testing1"
    click_button "Submit"
    click_link "Logout"
  end
  
  scenario "User can sign in with valid credentials" do
    sign_up_and_logout
    click_link "Log In"
    fill_in "email", with: "tester@mail.com"
    fill_in "password", with: "testing1"
    click_button "Login"
    expect(page).to have_content "Logged in!"
    expect(page).to have_content "Welcome Tester"
  end

  # scenario "User cannot sign in with invalid credentials" do
  #   sign_up_and_logout
  #   click_link "Log In"
  #   fill_in "email", with: "tester.com"
  #   fill_in "password", with: "testing1"
  #   click_button "Login"
  # end
end


