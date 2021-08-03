class ErrorSerializer
   include FastJsonapi::ObjectSerializer

   attributes :message

   set_id { nil }
end
