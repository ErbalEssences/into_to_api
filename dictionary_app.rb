
require 'http'
system "clear"


def get_word
  puts "Enter word, or hit enter with no text, to quit."
  puts "=" * 50
  word = gets.chomp  
  return word
end

api = "64e90a58d89a8e7f3f000001fe809d0cd55d32cb45b9f117e"
word = get_word
until word == ""
  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=1&includeRelated=false&useCanonical=false&includeTags=false&api_key=#{api}")
  response2 = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=#{api}")

  info = response.parse
  info2 = response2.parse
  first = info[0]
  part_of_speech = first["partOfSpeech"]
  definition = first["text"]
  pronunciation = info2[0]["raw"]
  puts "#{word.capitalize} is a #{part_of_speech}, the first definition is #{definition.downcase}"
  puts "#{word.capitalize} is pronounced #{pronunciation}."
  puts "" 
  puts ""
  # puts "Would you like more definitions, yes or no?"
  # answer = gets.chomp 
  # if answer == "yes"
  #   puts "How many?"
  #   number = gets.chomp
  #   response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=#{number}&includeRelated=false&useCanonical=false&includeTags=false&api_key=#{api}")
    




  word = get_word
end





