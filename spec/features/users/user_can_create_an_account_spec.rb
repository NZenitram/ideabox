require 'rails_helper'

describe "a user can be created and logged into" do
  scenario "a user can be created" do

    visit new_user_path

    fill_in "Username", with: "nick"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Welcome, nick")
  end

  scenario "a user can login to their account" do
    user = User.create(username: "Nick", password: "pass", password_confirmation: "pass")

    visit login_path
    within("#login_form") do
      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_on "Login"
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Successfully logged in!")
  end
  
  scenario "a user can logout" do
    user = User.create(username: "Nick", password: "pass", password_confirmation: "pass")

    visit login_path
    within("#login_form") do
      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_on "Login"
    end
    click_on "Logout"

    expect(page).to have_content("You are logged out!")
  end
end
