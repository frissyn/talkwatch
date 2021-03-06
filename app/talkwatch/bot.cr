require "json"
require "http"

module Talkwatch
    extend self
    
    class Bot
        getter client : HTTP::Client
        getter user : Objects::BotUser

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

            @user = Objects::BotUser.from_json(hash.to_json)
        end

        def gql(name : String, op : String, vars : Hash)
            headers = @headers
            headers["Content-Type"] = "application/json"
            load = {
                "operationName" => name,
                "query" => op,
                "variables" => vars.to_json
            }

            res = @client.post("/graphql", @headers, form=load.to_json)

            begin content = JSON.parse(res.body)
            rescue
                puts "\e[31mERROR\n#{res.body}\e[0m"
                return {} of String => Nil
            end
            
            content.as_h["data"].as_h
        end

        def get_posts(options : Hash)
            res = gql(
                "PostsFeed",
                Queries.posts,
                {
                    "order" => "new",
                    "count" => 30,
                    "after" => nil,
                    "boardSlugs" => ["all"],
                    "searchQuery" => nil,
                    "languages" => nil
                }.merge(options)
            )

            JSON.parse(res.to_json)["posts"]["items"].as_a
        end

        def get_post(options : Hash)
            res = gql(
                "post",
                Queries.postByID,
                {"id" => nil}.merge(options)
            )

            JSON.parse(res.to_json)["data"]["post"].as_h
        end

        def get_post_comments(options : Hash)
            res = gql(
                "post",
                Queries.postComments,
                {
                    "postId" => nil,
                    "order" => "new",
                    "count" => nil,
                    "after" => nil
                }.merge(options)
            )

            JSON.parse(res.to_json)["post"]["comments"]["items"].as_a
        end
    end
end
