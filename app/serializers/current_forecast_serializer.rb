class CurrentForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :city,
             :state,
             :date,
             :time,
             :icon,
             :temperature,
             :feels_like,
             :humidity,
             :visibility,
             :uv_index,
             :summary
end
