require "kemal"
require "./controllers/*"
require "./talkwatch/*"
require "./talkwatch/objects/*"

sid = ENV["connect.sid"]
bot = Talkwatch::Bot(sid)

log "User Context: #{bot.user.username}"

Kemal.run

