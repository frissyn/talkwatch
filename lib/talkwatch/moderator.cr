require "json"
require "http"
require "http/client"

module TalkWatch
    extend self

    class Moderator
        def initialize(sid : String)
            @sid = sid
            uri = URI.parse "https://repl.it/"
            @client = HTTP::Client.new uri
            @headers = HTTP::Headers{
                "Origin" => "https://repl.it",
                "Cookie" => "connect.sid=#{@sid}",
                "Referer" => "https://repl.it/account",
                "X-Requested-With" => "XMLHttpRequest",
            }
        end

        def authenticate
            res = @client.get("/is_authenticated", @headers)
            hash = JSON.parse(res.body)["user"].as_h

            hash.delete("gating")
            hash.delete("email_hash")
            hash.delete("customer_id")
            hash.delete("editor_preferences")
            hash.delete("email_notifications")

            @user = Objects::User.from_json(hash.to_json)

            return @user
        end

        def user
            return @user
        end
    end
end
