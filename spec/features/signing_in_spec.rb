require 'rails_helper'

describe 'Unauthorized' do

  it 'shows login and signup links for unauthorized user' do
    visit '/'

    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
  end

  it 'redirects to sign up page' do
    visit '/'

    click_link_or_button('Sign Up')

    expect(page).to have_content('Create new account')
  end

  it 'redirects to sign in page' do
    visit '/'

    click_link_or_button('Sign In')

    expect(page).to have_content('Sign in to your account')
  end

end

describe 'Authorized' do
  fixtures :users

  before(:all) do
    @user = User.find_by_email('user1@test.test')
    login_as @user

  end

  it 'doesnt show sign in and sign up links' do
    visit '/'

    expect(page).not_to have_content('Sign In')
    expect(page).not_to have_content('Sign Up')
  end

  it 'Shows signed in users email' do
    visit '/'

    expect(page).to have_content('user1@test.test')
  end

end