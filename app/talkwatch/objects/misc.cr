require "json"

module Talkwatch
    extend self

    module Objects
        class Avatar
            include JSON::Serializable

            @[JSON::Field(key: "url")]
            getter url : String

            @[JSON::Field(key: "id")]
            getter id : Int16
        end

        class Role
            include JSON::Serializable

            getter id : Int16
            getter name : String
            getter tagline : String?

            property __typename : String
        end

        class Board
            include JSON::Serializable

            getter id : Int16
            getter name : String
            getter color : String

            property __typename : String
        end

        class Language
            include JSON::Serializable
            
            getter id : Int16
            getter icon : String
            getter key : String
            getter displayName : String
            getter tagline : String

            property __typename : String
        end

        class Repl
            include JSON::Serializable

            getter id : Int16
            getter url : String
            getter description : String?
            getter isPrivate : Bool
            getter isAlwaysOn : Bool
            getter lang : Language
            
            property __typename : String
        end

        class Organization
            include JSON::Serializable

            getter id : Int16
            getter name : String

            property __typename : String
        end
    end
end
