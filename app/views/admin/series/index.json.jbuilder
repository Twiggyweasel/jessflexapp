json.array! @series do |series|
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
      json.activity do
        json.id series.activity.id
        json.name series.activity.name
     end
    end
  end
end