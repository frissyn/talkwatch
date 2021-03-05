require "json"

module Talkwatch
    extend self

    module Objects
        class Comment
            include JSON::Serializable

            getter id : String
            getter url : String
            getter body : String
            getter user : User?
            getter isAnswer : Bool
            getter voteCount : Int64
            getter timeCreated : String
            getter canVote : Bool
            getter hasVoted : Bool

            property __typename : String
        end
    end
end
