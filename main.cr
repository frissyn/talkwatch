require "kemal"
require "./lib/talkwatch"

sid = ENV["connect.sid"]

moderator = TalkWatch::Moderator.new(sid)
info = moderator.authenticate

pp info

Kemal.run
