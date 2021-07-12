require 'rails_helper'

describe 'CongressFacade' do
  it 'can find one senate member from search' do
    all_senators_stub
    senator = CongressFacade.find_senator_by_last_name("Baldwin")

    expect(senator).to be_a(SenateMember)
    expect(senator.last_name).to eq("Baldwin")
  end
end