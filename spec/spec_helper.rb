RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

def sign_up(username)
  visit '/users/new'
  fill_in 'Username', with: username
  fill_in 'Password', with: 'password'
  click_button 'Sign Up!'
end

def sign_up_as_ginger_baker
  sign_up('ginger_baker')
end

def log_in(username)
  visit '/session/new'
  fill_in 'Username', with: username
  fill_in 'Password', with: 'password'
  click_button 'Log In!'
end

def log_in_as_ginger_baker
  log_in('ginger_baker')
end

def create_goal(description = "Read more")
  visit '/goals/new'
  fill_in 'Description', with: description
  click_button 'Create Goal!'
  return Goal.last
end

def create_private_goal(description = "Do evil things")
  visit '/goals/new'
  fill_in 'Description', with: description
  check 'Private'
  click_button 'Create Goal!'
  return Goal.last
end
