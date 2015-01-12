require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before :each do
    visit "/users/new"
  end

  it "has a new user page" do
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      fill_in "Username", with: 'ginger_baker'
      fill_in "Password", with: 'longpass'
      click_on "Sign Up!"
      expect(page).to have_content "ginger_baker"
    end
  end

end

feature "logging in" do

  it "shows username on the homepage after login"

end

feature "logging out" do

  it "begins with logged out state"

  it "doesn't show username on the homepage after logout"

end
