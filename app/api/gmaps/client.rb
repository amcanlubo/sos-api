module Gmaps
    class Client
        def self.geolocate
            response = Request.call('get', "/geolocate")
        end
    end
end