class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location

  attribute :api_key do |object|
    object.api_key
  end
end
