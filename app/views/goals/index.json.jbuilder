json.array!(@goals) do |goal|
  json.extract! goal, :id, :match_id, :country_id, :player_id
  json.url goal_url(goal, format: :json)
end
