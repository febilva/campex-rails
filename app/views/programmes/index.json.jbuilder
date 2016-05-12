json.array!(@programmes) do |programme|
  json.extract! programme, :id, :name, :programme_type, :entrance, :self_finance, :intake, :indexing_rules, :ranking_priority, :general, :sc, :st, :muslim, :handicapped, :obc, :obh, :etb, :latin, :disabled
  json.url programme_url(programme, format: :json)
end
