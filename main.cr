require "kemal"
require "talkwatch"

sid = ENV["connect.sid"]

moderator = TalkWatch::Moderator.new(sid)

puts "Running with user context: '#{moderator.user.username}'"

Kemal.run
