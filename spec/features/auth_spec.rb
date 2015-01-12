# require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before :each do
    visit "/users/new"
  end

  it "has a new user page" do
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    before do
      sign_up_as_ginger_baker
    end

    it "shows username on the homepage after signup" do
      expect(page).to have_content "ginger_baker"
    end
  end

end

feature "logging in" do
  before do
    sign_up_as_ginger_baker
    log_in_as_ginger_baker
  end

  it "shows username on the homepage after login" do
    expect(page).to have_content('ginger_baker')
  end

end

feature "logging out" do

  it "begins with logged out state" do
    visit root_url
    expect(page).not_to have_content('ginger_baker')
  end

  it "doesn't show username on the homepage after logout" do
    sign_up_as_ginger_baker
    log_in_as_ginger_baker

    click_button "Log Out"
    expect(page).not_to have_content('ginger_baker')
  end

end
