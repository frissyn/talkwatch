require "json"

module TalkWatch
    module Objects
        extend self

        class Avatar
            include JSON::Serializable

            @[JSON::Field(key: "url")]
            getter url : String

            @[JSON::Field(key: "id")]
            getter id : Int64
        end

        class User
            include JSON::Serializable

            getter username : String
            getter email : String
            getter id : Int64
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
    end
end
