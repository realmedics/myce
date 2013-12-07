json.array!(@ces) do |ce|
  json.extract! ce, :id, :title, :hours
  json.url ce_url(ce, format: :json)
end
