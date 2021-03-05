require "json"

module Talkwatch
    extend self

    module Objects
        class Avatar
            include JSON::Serializable

            @[JSON::Field(key: "url")]
            getter url : String

            @[JSON::Field(key: "id")]
            getter id : Int64
        end

        class BotUser
            include JSON::Serializable

            getter id : Int64
            getter username : String
            getter email : String
            getter first_name : String
            getter last_name : String
            getter organization_id : Int64
            getter time_created : String
            getter icon : Avatar?
            getter roles : Array(String)
            getter bio : String
            getter is_verified : Bool
            getter is_over_limit : Bool
        end

        class User
            include JSON::Serializable

            getter id : Int64
            getter fullName : String
            getter username : String
            getter image : String
            getter bio : String?
            getter karma : Int64
            getter isHacker : Bool
            getter timeCreated : String
            getter roles : Array(Role?)
            getter organization : Hash?
            getter languages : Array(Language?)
        end
    end
end
