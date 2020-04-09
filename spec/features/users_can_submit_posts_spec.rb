require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  def sign_up_and_create
    visit "/"
    click_link "Sign Up!"
    fill_in "user_name", with: "Tester"
    fill_in "user_email", with: "tester@mail.com"
    fill_in "user_password", with: "testing1"
    click_button "Submit"
    click_link "New Post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
  end

  scenario "Can submit posts and view them" do
    sign_up_and_create
    expect(page).to have_content("Hello, world!")
  end

  scenario "Cannot make a post unless signed in" do
    visit "/posts"
    expect(page).to_not have_link "New Post"
  end

  scenario "Can submit posts and see who created it" do
    sign_up_and_create
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Tester")
  end

  scenario "You can see others users posts if you're not signed in." do
    sign_up_and_create
    click_link "Logout"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Tester")
  end

  scenario "You can see what date and time you made a post" do
    sign_up_and_create
    expect(page).to have_content("#{Time.now.strftime("%d %b %Y at %H:%M")}")
    expect(page).to have_content("Hello, world!")
  end

  # Include gem 'orderly' to get 'appear_before' working.
  scenario "posts can display is descending order" do 
    sign_up_and_create
    click_link "New Post"
    fill_in "Message", with: "Hello, world 2!"
    click_button "Submit"
    expect("Hello, world 2!").to appear_before "Hello, world!" 
  end

  # scenario "Posts can display break lines/whitespace" do
  #   sign_up_and_create  
  #   click_link "New Post"
  #   fill_in "Message", with: "This\nmessage\nhas line\nbreaks"
  #   click_button "Submit"
  #   expect(page).to have_content "This\n<br />message\n<br />has line\n<br />breaks"
  #   expect(page).to have_content "Hello, world!"
  # end
end
