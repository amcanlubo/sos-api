require 'rest-client'

module Gmaps
    class Request

        TOKEN = 'AIzaSyAFhViEbvEh-VK4nq82EWmwcLFVk8Amwo4'
        BASE_URL = 'https://www.googleapis.com/geolocation/v1'

        def self.call(http_method, endpoint)
            result = RestClient::Request.execute(
                method: http_method,
                url:"#{BASE_URL}#{endpoint}?key=#{TOKEN}",
                headers: {'Content-Type' => 'application/json'}
            )
            { code: result.code, status: 'success', data: JSON.parse(result.body)}
            rescue RestClient::ExceptionWithResponse => error
                { code: error.http_code, status: error.message, data: Rawg::Errors.map(error.http_code) }

        end
    end
end