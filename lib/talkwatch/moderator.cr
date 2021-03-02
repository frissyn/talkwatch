require "http"
require "http/client"

module TalkWatch
    class Moderator
        property sID
        getter sID : String

        def initialize(sid : String)
            @sID = sid
            @client = HTTP::Client.new "repl.it/graphql"
        end
    end
end
