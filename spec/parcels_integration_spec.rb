require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the parcels execution path', {:type => :feature}) do

  it('takes entries and returns the cost of shipping the parcel') do
   visit('/')
   fill_in('height', :with => '4')
   fill_in('width', :with => '4')
   fill_in('length', :with => '4')
   fill_in('weight', :with => '5')

  check 'speed'
  #  find(:css, "speed").set(false)

   fill_in('distance', :with => '25')
   click_button('Submit')
   expect(page).to have_content('The cost of shipping your package is: $11.25')
 end
end
