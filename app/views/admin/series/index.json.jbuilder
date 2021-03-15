json.array! @series do |series|
  json.links do
    json.self admin_series_url(series)
  end
  json.data do
    json.type "series"
    json.id series.id
    json.attributes do
      json.set series.set
      json.rep series.rep
      json.created_at series.created_at
      json.updated_at series.updated_at
    end
    json.relationships do
      json.exercise do
        json.links do
          json.self admin_exercise_url(series.exercise)
        end
        json.data do
          json.type "exercise"
          json.id series.exercise.id
          json.name series.exercise.name
        end
      end
    end
  end
end
