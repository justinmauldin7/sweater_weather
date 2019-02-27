class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :location

  attribute :current_weather do |object|
    object.current_weather
  end
end
