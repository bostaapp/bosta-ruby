# frozen_string_literal: true

module Bosta
  # Represents the contact person type that used by bosta apis
  class ContactPerson < BostaObject
    attr_accessor :name, :phone, :email

    #=== Initialize Contact Person Object
    # * +name+
    # * +phone+
    # * +email+ (optional) String
    #
    def initialize(name, phone, email = nil)
      super()
      @name = name
      @phone = phone
      @email = email

      check_required_fields('name', 'phone')
    end
  end
end
