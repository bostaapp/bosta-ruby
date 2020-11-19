# frozen_string_literal: true

module Bosta
  # Represents the receiver type that used by bosta apis
  class Receiver < BostaObject
    attr_accessor :first_name, :last_name, :phone, :email

    #=== Initialize Receiver Object
    # * +name+
    # * +phone+
    # * +email+ (optional) String
    #
    def initialize(name, phone, email = nil)
      super()
      names_arr = name.split
      @first_name = names_arr.shift
      @last_name = names_arr.join(' ')
      @last_name = '-' if @last_name.empty?
      @phone = phone
      @email = email

      check_required_fields('first_name', 'phone')
    end
  end
end
