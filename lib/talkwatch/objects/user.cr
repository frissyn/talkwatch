require "json"

module TalkWatch
    module Objects
        extend self

        class Avatar
            include JSON::Serializable

            @[JSON::Field(key: "url")]
            property url : String

            @[JSON::Field(key: "id")]
            property id : Int64
        end

        class User
            include JSON::Serializable

            property username : String
            property email : String
            property id : Int64
            property first_name : String
            property last_name : String
            property organization_id : Int64
            property time_created : String
            property icon : Avatar?
            property roles : Array(String)
            property bio : String
            property is_verified : Bool
            property is_over_limit : Bool
        end
    end
end
