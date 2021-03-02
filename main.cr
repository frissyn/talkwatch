require "kemal"
require "talkwatch"

sid = ENV["connect.sid"]

moderator = TalkWatch::Moderator.new(sid)
user = moderator.authenticate

puts "Running with user context: '#{user}'"

Kemal.run
