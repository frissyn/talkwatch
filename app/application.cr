require "kemal"
require "./talkwatch"
require "./controllers/*"

SID = ENV["connect.sid"]
bot = Talkwatch::Bot.new(SID)

puts "User Context: #{bot.user.username}"

Kemal.run
