module Bosta
    class << self
      attr_accessor :apiKey, :baseUrl
  
      def apiKey
        get_key :apiKey
      end
  
      def baseUrl
        get_key :baseUrl
      end
  
      def get_key(key)
        instance_variable_get("@#{key}") || raise("Set Bosta.#{key} to use this feature")
      end
    end
end
  