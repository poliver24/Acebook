require 'rails_helper'



RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/new"
    fill_in "user_name", with: "Tester"
    fill_in "user_email", with: "tester@mail.com"
    fill_in "user_password", with: "testing1"
    click_button "Submit"
    click_link "New Post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
