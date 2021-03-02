require "kemal"

module TalkWatch
    module Webview
        get "/" do
            render "views/index.ecr"
        end

        Kemal.config.port = 8080
        Kemal.run
    end
end
