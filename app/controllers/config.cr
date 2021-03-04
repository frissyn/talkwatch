require "kemal"

module Application
    extend self

    class Config
        Kemal.config.port = 8080
    end
end
