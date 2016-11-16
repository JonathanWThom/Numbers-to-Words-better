require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the numbers to words path', {:type => :feature}) do
  it('processes the user entry and returns it as words') do
    visit('/')
    fill_in('number', :with => 530)
    click_button('Send')
    expect(page).to have_content('five hundred thirty')
  end
end
