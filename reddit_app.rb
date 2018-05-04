require 'unirest'

puts "Welcome to the Terminal Reddit Browser"
print "Please enter a subject you would like to visit: "

subject = gets.chomp 

response = Unirest.get("https://www.reddit.com/r/#{subject}.json")

subreddit_title = response.body["data"]["children"][2]["data"]["subreddit"]
subreddit_info = response.body["data"]["children"][2]["data"]["title"]



subreddit_title = subreddit_title.upcase








p "Currently viewing: /r/#{subreddit_title}"
p subreddit_info 