require "kemal"

module TalkWatch
    module Webview
        get "/" do
            "TalkWatch running on version 0.1a"
        end

        Kemal.config.port = 8080
        Kemal.run
    end
end
