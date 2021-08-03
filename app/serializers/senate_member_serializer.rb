class SenateMemberSerializer
   include FastJsonapi::ObjectSerializer

   attributes :first_name, :last_name, :twitter_account

   set_id { nil }
end
