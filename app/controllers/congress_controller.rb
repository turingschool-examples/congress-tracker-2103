class CongressController < ApplicationController
  skip_before_action :verify_authenticity_token

  def search
    found_senator = CongressFacade.find_senator_by_last_name(params[:search])
    if found_senator
      render json: SenateMemberSerializer.new(@found_senator)
    else
      render json: ErrorSenator.new('No Senator Matches your Search')
    end
  end

  def search_state
    @house_members = CongressFacade.find_all_house_members_by_state(params[:state])
  end
end

# 1. turn json into objects for the view  -- done
# 2. encapsulate and abstract logic chunks
#   1. service (call to the api) -- done
#   2. facade (managing our data to return to the view)
