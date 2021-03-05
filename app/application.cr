require "kemal"
require "./controllers/*"

require "./talkwatch/*"
require "./talkwatch/objects/*"

SID = ENV["connect.sid"]
bot = Talkwatch::Bot.new(SID)

puts "User Context: #{bot.user.username}"

puts typeof(bot.get_posts({"count" => 1}))

Kemal.run
