require 'rails_helper.rb'

describe 'all users' do
  fixtures :fridges
  describe 'unauthenticate user'  do

    it 'can not see add fridge link' do

      visit '/fridges'

      expect(page).not_to have_content 'New fridge'
    end

    it 'can not visit new fridge page' do

      visit '/fridges/new'
      expect(current_path).to eq '/users/sign_in'
    end
    
  end

  describe 'authenticate user'  do
    fixtures :users

    before(:each) do
      @user = users(:user1)
      login_as @user, scope: :user
    end

    it 'can visit new fridge page' do

      visit '/fridges'
      click_link 'New fridge'

      expect(current_path).to eq '/fridges/new'

    end

    it 'can add new fridge' do

      visit '/fridges/new'
      fill_in 'Name', with: 'New awsome fridge'
      click_button 'Create Fridge'

      expect(page).to have_content 'New awsome fridge'

      click_link 'Fridges'

      expect(page).to have_content 'New awsome fridge'
    end

    it 'can add new fridge' do

      visit '/fridges/new'
      click_button 'Create Fridge'

      expect(page).to have_content "Name can't be blank"

    end
  end  
end
