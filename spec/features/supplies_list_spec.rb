require 'rails_helper'

describe 'supply list in fridge view' do

  fixtures :users, :products, :fridges, :supplies


  describe 'unauthorized' do
    it 'doesnt show products in a fridge' do
      visit '/fridges/2'

      expect(page).not_to have_content('Kielbasa')
    end
  end

  describe 'unauthorized' do

    before(:each) {login_as User.find(1)}

    it 'doesnt show products in a fridge' do
      visit '/fridges/2'

      expect(page).to have_content('Kielbasa')
    end
  end


end