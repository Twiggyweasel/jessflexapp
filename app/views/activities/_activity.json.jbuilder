json.extract! activity, :id, :name, :simple_desc, :detail_desc, :location, :category, :set_label, :has_weight, :machine_based, :created_at, :updated_at
json.url activity_url(activity, format: :json)
