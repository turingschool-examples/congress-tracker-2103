class CongressController < ApplicationController
  def search
    @found_senator = CongressFacade.find_senator_by_last_name(params[:search])
  end

  def search_state
    @house_members = CongressFacade.find_all_house_members_by_state(params[:state])
  end
end

# 1. turn json into objects for the view  -- done 
# 2. encapsulate and abstract logic chunks 
#   1. service (call to the api) -- done 
#   2. facade (managing our data to return to the view)
