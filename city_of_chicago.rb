require "http"

response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")
data = response.parse

data.each do |employee|
  puts ""
  puts employee["name"]
  puts employee["department"]
  puts employee["annual_salary"]
  puts ""
  puts "=" * 50
end
