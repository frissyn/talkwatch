require "kemal"
require "talkwatch"

sid = ENV["connect.sid"]
automod = TalkWatch::Moderator.new(sid)

puts "Running with user context: '#{automod.user.username}'"

Kemal.run