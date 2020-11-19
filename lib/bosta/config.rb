# frozen_string_literal: true

# Configuration of bosta module
module Bosta
  class << self
    attr_writer :api_key, :base_url

    #:nodoc:
    def api_key
      get_key :api_key
    end

    #:nodoc:
    def base_url
      get_key :base_url
    end

    private

    def get_key(key)
      instance_variable_get("@#{key}") || raise("Set Bosta.#{key} to use this feature")
    end
  end
end
