require "kemal"

module Application
    extend self
    
    class Routes
        get "/" do
            render "views/index.ecr"
        end
    end
end
