# frozen_string_literal: true

module Bosta
  # Represents the address type that used by bosta apis
  class Address < BostaObject
    attr_accessor :city_code, :zone, :first_line, :second_line, :district, :building_number, :floor, :apartment

    #=== Initialize Address Object
    # * +city_code+ The city code like 'EG-01', you can get all cities codes from City Class
    # * +first_line+ your address firstline
    # * +zone+ (optional), find all zones in a city thorugh the City Class
    # * +second_line+ (optional) Sring
    # * +building_number+ (optional) String
    # * +floor+ (optional) String
    # * +apartment+ (optional) String
    #
    def initialize(city_code,
                   first_line,
                   zone = nil,
                   second_line = nil,
                   building_number = nil,
                   floor = nil,
                   apartment = nil)
      super()
      @city_code = city_code
      @first_line = first_line
      @zone = zone
      @second_line = second_line
      @building_number = building_number
      @floor = floor
      @apartment = apartment

      check_required_fields('city_code', 'first_line')
    end
  end
end
