require 'rails_helper'

describe 'all_users'  do
  fixtures :fridges, :memberships, :users

  describe 'authenticate user' do
    before(:each) do
      user = users(:user1)
      login_as user, scope: :user
    end

    xit 'can see my fridges' do
      visit '/'
      click_link 'My fridges'

      expect(page).to have_content 'Moja lodówka'
      expect(page).to have_content 'Super lodówka'
    end

    it 'can add fridge via frides view' do
      visit "fridges/#{fridges(:fridge4).id}"

      click_link 'Join fridge'

      # expect(current_path).to eq '/fridges'
      expect(page).to have_content 'El Passion lodówka mała'
    end

    xit 'cant join to fridge that already joined' do
      visit "fridges/#{fridges(:fridge1).id}"
      puts fridges(:fridge1).inspect
      puts fridges(:fridge1).users

      expect(page).not_to have_content 'Join fridge'
    end

  end
end
