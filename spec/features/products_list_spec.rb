require 'rails_helper'

describe 'products list' do

  fixtures :products, :users

  describe 'unauthorized' do

    it 'displays products list' do
      visit '/products'

      expect(page).to have_content('Kielbasa')
      expect(page).to have_content('Banan')
      expect(page).to have_content('Woda_gazowana')
    end

    it 'does not show Add to fridge button' do
      visit '/products'

      expect(page).not_to have_content('Add to fridge')
    end

  end

  describe 'Authorized' do

    before(:each) { login_as User.find(1) }

    it 'displays products list' do
      visit '/products'

      expect(page).to have_content('Kielbasa')
      expect(page).to have_content('Banan')
      expect(page).to have_content('Woda_gazowana')
    end

    it 'shows Add to fridge button' do
      visit '/products'

      expect(page).to have_content('Add to fridge')
    end

  end

end