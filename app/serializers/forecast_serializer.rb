class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :city,
             :state,
             :date,
             :time

  attribute :current do |object|
    object.current
  end
  attribute :hourly do |object|
    object.hourly
  end
  attribute :daily do |object|
    object.daily
  end
end
