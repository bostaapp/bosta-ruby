# frozen_string_literal: true

require 'faraday'
require 'json'

module Bosta #:nodoc: all
  class Resource
    def self.connection(method)
      conn = Faraday.new(
        url: Bosta.base_url,
        params: { param: '1' },
        headers: {
          'Content-Type' => 'application/json',
          'Authorization': Bosta.api_key,
          'X-Requested-By': 'ruby-sdk'
        }
      )
      raise 'Not Existed Method' unless conn.respond_to? method

      conn
    end

    def self.send(method, path, body = {}, params = {})
      conn = Resource.connection(method)
      full_path = "#{Bosta.base_url}/api/v1/#{path}"

      res = conn.public_send(method, full_path) do |req|
        req.params = params
        req.body = body.to_json
      end
      res = JSON.parse(res.body)

      return res['data'] || res['message'] if res['success']

      # if not Success
      raise res['message']
    rescue StandardError
      raise
    end
  end
end
