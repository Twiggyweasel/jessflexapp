json.extract! activity, :id, :name, :machine_based, :has_weight, :weight, :rep, :set, :set_type, :simple_desc, :detail_desc, :location, :category, :created_at, :updated_at
json.url activity_url(activity, format: :json)
