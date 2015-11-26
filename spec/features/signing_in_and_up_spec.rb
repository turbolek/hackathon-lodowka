require 'rails_helper'

describe 'sign in' do
  fixtures :users

  it 'signs in user who has an account' do
    visit 'users/sign_in'

    fill_in 'Email', with: 'user1@test.test'
    fill_in 'Password', with: '12345678'

    click_button 'Log in'

    expect(page).to have_content('user1@test.test')
  end

  it 'doesnt sign in user who has not an account' do
    visit 'users/sign_in'

    fill_in 'Email', with: 'not_existing_user@test.test'
    fill_in 'Password', with: '12345678'

    click_button 'Log in'

    expect(page).to have_content('Invalid email or password.')
  end

end

describe 'sign up' do

  it 'creates new account with given info' do

    visit 'users/sign_up'

    fill_in 'Email', with: 'test_pro_killer_user@test.test'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'

    click_button 'Sign up'

    expect(page).to have_content('test_pro_killer_user@test.test')
  end

end