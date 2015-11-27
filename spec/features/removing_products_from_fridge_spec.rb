require 'rails_helper'

describe 'removing products' do

  fixtures :users, :supplies, :fridges, :memberships

  describe 'unauthorized' do
    it 'doest show remove product button to unauthorized user' do
      visit '/fridges/1'

      expect(page).to_not have_content('Remove')
    end
  end

  describe 'authorized but not member' do

    before(:each) { login_as User.find(2) }

    it 'doesnt show remove product button' do
      visit '/fridges/1'

      expect(page).to_not have_content('Remove')
    end
  end

  describe 'authorized and member' do

    before(:each) { login_as User.find(1), scope: :user }

    it 'shows remove product button' do
      visit '/fridges/1'

      expect(page).to have_content('Remove')
    end

    it 'ramoves product from fridge' do
      visit '/fridges/1'

      click_link_or_button('Remove')

      expect(page).to_not have_content('Kielbasa')
    end
  end
end
