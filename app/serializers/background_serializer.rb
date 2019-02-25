class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :city,
             :state,
             :photo_id,
             :photo_secret,
             :photo_server,
             :photo_farm,
             :photo_title,
             :photo_url
end
