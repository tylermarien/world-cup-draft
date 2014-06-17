json.array!(@players) do |player|
  json.extract! player, :id, :name, :country_id
  json.url player_url(player, format: :json)
end
