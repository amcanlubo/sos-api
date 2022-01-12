module Gmaps
    class Errors
        def self.map(code)
            case code
            when 401
                return "Unauthorized. Try again"
            when 404
                return "Not found"
            else
                return "Service unavailable"
            end
        end
    end
end