json.array! @variations do |variation|
  json.links do
    json.self "admin/variations/#{variation.id}"
  end
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
      json.exercise do
        json.data do
          json.id variation.exercise.id
          json.name variation.exercise.name
        end
      end
    end
  end
end
