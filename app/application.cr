require "kemal"
require "./controllers/*"

require "./talkwatch/*"
require "./talkwatch/objects/*"

SID = ENV["connect.sid"]
bot = Talkwatch::Bot.new(SID)

puts "User Context: #{bot.user.username}"

res = bot.gql(
    "PostsFeed",
    Talkwatch::Queries.posts,
    {
        "order" => "new",
        "count" => 30,
        "after" => nil,
        "boardSlugs" => ["all"],
        "searchQuery" => nil,
        "languages" => nil
    }
)

File.write("res.json", res.to_json)

Kemal.run
