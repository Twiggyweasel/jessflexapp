json.links do
  json.self activity_url(@activity)
end
json.data do
  json.type "activity"
  json.id @activity.id
  json.attributes do
    json.name @activity.name
    json.simple_desc @activity.simple_desc
    json.detail_desc @activity.detail_desc
    json.location @activity.location
    json.category @activity.category
    json.set_label @activity.set_label
    json.has_weight @activity.has_weight
    json.machine_based @activity.machine_based
  end
  json.relationships do
    json.array! @activity.series.each do |series|
      json.data do
        json.type "series"
        json.id series.id
      end
    end

    json.array! @activity.variations.each do |variation|
      json.data do
        json.type "variation"
        json.id variation.id
      end
    end
  end
end
