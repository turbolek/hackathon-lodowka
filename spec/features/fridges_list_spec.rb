require 'rails_helper.rb'

describe 'unauthenticate user'  do
  fixtures :fridges, :memberships, :users

  it 'see fridges list' do

    visit '/'

    click_link 'Fridges'

    expect(page).to have_content 'Moja lodówka'
    expect(page).to have_content 'El Passion lodówka srebrna'

  end
  
end
