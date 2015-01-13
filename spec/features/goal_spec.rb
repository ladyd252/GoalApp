# require 'spec_helper'
require 'rails_helper'

feature "Goal creation" do
  before :each do
    sign_up_as_ginger_baker
  end

  it "has a new goal page" do
    # visit "/goals/new"
    expect(page).to have_content "Create A Goal"
  end

  feature "creating a new goal" do
    before :each do
      create_goal
    end

    it "shows the goal's description after creating a new goal" do
      expect(page).to have_content("Read more")
      expect(page).not_to have_content("private")
      expect(page).not_to have_content("completed")
    end
  end
end

feature "Goal editing" do
  before :each do
    sign_up_as_ginger_baker
    create_goal
  end

  it "has an edit page" do
    visit edit_goal_url(Goal.first)
    expect(page).to have_content("Edit Goal")
    expect(find_field('Description').value).to eq "Read more"
  end

  it "updates the goal properly" do
    visit edit_goal_url(Goal.first)
    fill_in "Description", with: "new things"
    click_button "Update Goal!"
    expect(page).to have_content("new things")
  end
end

feature "Goal deletion" do
  before :each do
    sign_up_as_ginger_baker
    create_goal
  end

  it "has delete buttons on index page" do
    visit goals_url
    expect(page).to have_button('Delete')
  end

  it "delete button removes goal" do
    visit goals_url
    click_button('Delete')
    expect(page).not_to have_content('Read more')
  end

  it "should not have delete links for other users' goals" do
    sign_up("OtherDude")
    visit goal_url(Goal.first)
    expect(page).not_to have_button('Delete')
  end
end

feature "Privacy" do
  before :each do
    sign_up_as_ginger_baker
    @goal = create_private_goal
    click_button('Log Out')
    sign_up('OtherChick')
  end

  it "doesn't show private goals on the index" do
    visit goals_url
    expect(page).not_to have_content(@goal.description)
  end

  it "doesn't show private goals to others on user page" do
    visit user_url(@goal.user)
    expect(page).not_to have_content(@goal.description)
  end
end

feature "Goal completion" do
  before :each do
    sign_up_as_ginger_baker
    @goal = create_goal
  end

  context "on the user show page" do
    it "Shouldn't show when a goal is incomplete" do
      visit user_url(@goal.user)
      expect(page).not_to have_selector("#complete_#{@goal.id}")
    end

    it "Should show when a goal is complete" do
      @goal.update(completed: true)
      visit user_url(@goal.user)
      expect(page).to have_selector("#complete_#{@goal.id}")
    end
  end

  context "on the goal index page" do
    it "Shouldn't show when a goal is incomplete" do
      visit goals_url
      expect(page).not_to have_selector("#complete_#{@goal.id}")
    end

    it "Should show when a goal is complete" do
      @goal.update(completed: true)
      visit goals_url
      expect(page).to have_selector("#complete_#{@goal.id}")
    end
  end
end
