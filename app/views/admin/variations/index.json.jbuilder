json.array! @variations do |variation|
  json.data do
    json.type "variation"
    json.id variation.id
    json.attributes do
      json.description variation.description
      json.weight variation.weight
      json.created_at variation.created_at
      json.updated_at variation.updated_at
    end
    json.relationships do
      json.activity do
        json.id variation.activity.id
        json.name variation.activity.name
     end
    end
  end
end