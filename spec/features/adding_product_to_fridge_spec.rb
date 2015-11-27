require 'rails_helper'

describe 'add product to fridge' do

  fixtures :products, :users, :fridges, :supplies

  before(:each) {login_as User.find(1)}

  context 'add to fridge button pressed' do
  it 'redirects to fridge list page' do
    visit '/products'

    first(:link, 'Add to fridge').click

    expect(page).to have_current_path('/fridges?product_id=1')
  end

  it 'allows to choose a fridge' do
    visit '/fridges?product_id=1'


    expect(page).to have_content('Choose fridge')
  end

  end

  context 'fridge chosen' do
    it 'adds product to fridge' do

      visit '/fridges?product_id=1'
      first(:link, 'Choose fridge').click

      expect(Supply.find(100).product_id).to eq(1)

    end
  end

end