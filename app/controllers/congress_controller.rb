class CongressController < ApplicationController
  def search
    response = Faraday.get('https://api.propublica.org/congress/v1/117/senate/members.json') do |req|
      req.headers['X-API-KEY'] = ENV['PROPUBLICA_API_KEY']
    end
    json = JSON.parse(response.body, symbolize_names: true)
    senators = json[:results].first[:members]
    @found_senator = senators.find do |senator|
      # match last name with search param
      senator[:last_name] == params[:search]
    end
  end
end
