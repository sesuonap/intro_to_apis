require 'unirest'



puts "Welcome to Tommy's Dictionary"
puts "============================="

print "Enter a word: "
word = gets.chomp

response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

example_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
")

pron_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
")

word_data = response.body 
selected_word = response.body[0]["word"]
definition = response.body[0]["text"]
example = example_response.body["text"]
pronunciation = pron_response.body[0]["raw"]

selected_word = selected_word.capitalize
definition = definition.capitalize
example = example.capitalize


puts "Word: #{selected_word}"
puts "Definition: #{definition}"
puts "Example: #{example}"
puts "Pronunciation: #{pronunciation}"
puts "============================="