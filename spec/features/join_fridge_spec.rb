require 'rails_helper'

describe 'all_users'  do
  fixtures :fridges, :memberships, :users

  describe 'authenticate user' do
    before(:each) do
      @user = users(:user1)
      login_as @user, scope: :user
    end

    it 'can see my fridges' do
      visit '/'
      click_link 'My fridges'

      expect(page).to have_content 'Moja lodówka'
      expect(page).to have_content 'Super lodówka'
      expect(page).not_to have_content 'El Passion lodówka mała'
    end

    it 'can add fridge via frides view' do
      visit 'fridges/4'

      click_link 'Join fridge'

      expect(page).to have_content 'El Passion lodówka mała'
    end

    it 'cant join to fridge that already joined' do
      visit 'fridges/1'

      expect(page).not_to have_content 'Join fridge'
    end

  end
end
