require "json"
require "http"

module Talkwatch
    extend self
    
    class Bot
        getter client : HTTP::Client
        getter user : Objects::User

        property sid : String
        property headers : HTTP::Headers

        def initialize(sid : String)
            @sid = sid
            @client = HTTP::Client.new(URI.parse("https://repl.it/"))
            @headers = HTTP::Headers{
                "Origin" => "https://repl.it",
                "Cookie" => "connect.sid=#{@sid}",
                "Referer" => "https://repl.it/account",
                "X-Requested-With" => "XMLHttpRequest",
            }

            res = @client.get("/is_authenticated", @headers)
            hash = JSON.parse(res.body)["user"].as_h

            hash.delete("gating")
            hash.delete("email_hash")
            hash.delete("customer_id")
            hash.delete("editor_preferences")
            hash.delete("email_notifications")

            @user = Objects::User.from_json(hash.to_json)
        end

        def gql(name : String, op : String, vars : Hash(String, String))
            load = {
                "operationName" => name,
                "query" => op,
                "variables" => variables.to_json
            }

            res = @client.post("/graphql", @headers, form=load)

            res
        end
    end
end
