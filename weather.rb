require "http"

system "clear"
puts "Welcome to the Weather app"
puts "=" * 50
puts ""

puts "Enter a City"
city = gets.chomp

responce = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&appid=ad55a020f8382071e966f69d41d2a5a9")

weather_data = responce.parse



main = weather_data["main"]

temp = main["temp"] 
low = main["temp_min"] 
high = main["temp_high"] 
discription = weather_data["weather"][0]["description"]

puts ""
puts "Today in  #{city}, it is #{temp} degrees with #{discription}."
puts "You can expect a high of #{high} and a low of #{low}."
puts ""