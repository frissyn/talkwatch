require "kemal"
require "./controllers/*"

require "./talkwatch/*"
require "./talkwatch/objects/*"

SID = ENV["connect.sid"]
bot = Talkwatch::Bot.new(SID)

puts "User Context: #{bot.user.username}"

Kemal.run
