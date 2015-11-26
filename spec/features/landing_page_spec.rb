require 'rails_helper'

describe 'Unauthorized' do

  it 'shows login and signup links for unauthorized user' do
    visit '/'

    expect(page).to have_content('Login')
    expect(page).to have_content('Sign up')
  end

  it 'redirects to Sign up page' do
    visit '/'

    click_link_or_button('Sign up')

    expect(page).to have_content('Create new account')
  end

  it 'redirects to sign in page' do
    visit '/'

    click_link_or_button('Login')

    expect(page).to have_content('Sign in to your account')
  end

end

describe 'Authorized' do
  fixtures :users

  before(:all) do
    @user = User.find_by_email('user1@test.test')
    login_as @user

  end

  it 'doesnt show sign in and Sign up links' do
    visit '/'

    expect(page).not_to have_content('Login')
    expect(page).not_to have_content('Sign up')
  end

  it 'Shows signed in users email' do
    visit '/'

    expect(page).to have_content('user1@test.test')
  end

end