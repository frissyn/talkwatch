require "json"

module Talkwatch
    extend self

    module Objects
        class Post
            include JSON::Serializable

            getter user : User?

            getter id : String
            getter timeCreated : String
            getter title : String
            getter preview : String
            getter url : String
            getter commentCount : Int16
            getter isPinned : Bool
            getter isLocked : Bool
            getter isHidden : Bool
            getter isAnnouncement : Bool
            getter isAnswered : Bool
            getter isAnswerable : Bool
            getter voteCount : Int16
            getter canVote : Bool
            getter hasVoted : Bool
            getter repl : Repl?
            getter board : Board?

            property __typename : String
        end
    end
end