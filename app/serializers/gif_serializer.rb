class GifSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :copyright

  attribute :images do |object|
    object.images
  end
end
