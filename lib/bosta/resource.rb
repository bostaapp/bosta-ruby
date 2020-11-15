require 'faraday'
require 'json'

module Bosta
    class Resource

        def self.send(method, path, body = {}, params = {})
            conn = Faraday.new(
                url: Bosta.baseUrl,
                params: {param: '1'},
                headers: {
                    'Content-Type' => 'application/json',
                    'Authorization': Bosta.apiKey,
                    'X-Requested-By': 'ruby-sdk'
                }
              )
              
            raise "Not Existed Method" unless conn.respond_to? method

            fullPath = "#{Bosta.baseUrl}/api/v1/#{path}"

            res = conn.public_send(method, fullPath) do |req|
                req.params = params
                req.body = body.to_json
            end
            res = JSON.parse(res.body)

            return res['data'] || res['message'] if res['success']
            #if not Success
            raise res['message']

            rescue
                raise
        end
        
    end
end