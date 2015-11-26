require 'rails_helper'

describe 'sign in' do
  it 'signs in user who has an account' do
    visit '/'

    click_link_or_button 'Sign In'

    fill_in 'Email', with: 'user1@test.test'
    fill_in 'Password', with: '123'
    fill_in 'Password confirmation', with: '123'

    click_button 'Sign in'

    expect(page).to have_content('user1@test.test')
  end

  it 'doesnt sign in user who has not an account' do
    visit '/'

    click_link_or_button 'Sign In'

    fill_in 'Email', with: 'not_existing_user@test.test'
    fill_in 'Password', with: '123'
    fill_in 'Password confirmation', with: '123'

    click_button 'Sign in'

    expect(page).to have_content('Wrong email or password')
  end

end

describe 'sign up' do

  it 'creates new account with given info' do

    visit '/'

    click_link_or_button 'Sign Up'

    fill_in 'Email', with: 'user1@test.test'
    fill_in 'Password', with: '123'
    fill_in 'Password confirmation', with: '123'

    click_button 'Sign up'

    expect(page).to have_content('user1@test.test')
  end

end