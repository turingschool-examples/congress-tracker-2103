require 'rails_helper'
RSpec.describe 'State House Member Search' do
  describe 'happy path' do
    it 'allows user to search for house members by state' do
      json_response = File.read('spec/fixtures/colorado_house_members.json')
      
      stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json").
      to_return(status: 200, body: json_response, headers: {})

      visit root_path

      select "Colorado", :from => "state"
      click_button 'Search By State'

      expect(page.status_code).to eq 200
      expect(page).to have_content("7 Results")
      expect(page).to have_content("Joe Neguse")
      expect(page).to have_content("Ed Perlmutter")
    end
  end
end