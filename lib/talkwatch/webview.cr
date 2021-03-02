require "kemal"

module TalkWatch
    module Webview
        get "/" do
            render "views/index.ecr"
        end

        get "/logs" do
            render "views/actions.ecr"
        end

        Kemal.config.port = 8080
    end
end
