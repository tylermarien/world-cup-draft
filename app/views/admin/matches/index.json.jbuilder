json.array!(@matches) do |match|
  json.extract! match, :id, :occurs_at, :home_id, :away_id
  json.url match_url(match, format: :json)
end
