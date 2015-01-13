require 'rails_helper'

feature "Commenting on goals" do
  before do
    sign_up_as_ginger_baker
    create_goal('goal1')
    create_goal('goal2')
  end

  it "can add a comment to a goal" do
    fill_in "Goal Comment", with: "cool goal, gurl"
    click_button 'Add Comment'
    expect(page).to have_content("cool goal, gurl")
  end
end

feature "Commenting on users" do
  before do
    sign_up_as_ginger_baker
    create_goal('goal1')
    create_goal('goal2')
  end

  it "can add a comment to a goal" do
    fill_in "User Comment", with: "You're cool"
    click_button 'Leave me a comment'
    expect(page).to have_content("You're cool")
  end
end
