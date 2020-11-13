require('./BostaObject.rb')

class Address < BostaObject
    attr_accessor :cityCode, :zone, :firstLine, :secondLine, :district, :buildingNumber, :floor, :apartment
    def initialize(cityCode, firstLine, zone=nil, secondLine=nil, buildingNumber=nil, floor=nil, apartment=nil)
        @cityCode = cityCode
        @firstLine = firstLine
        @zone = zone
        @secondLine = secondLine
        @buildingNumber = buildingNumber
        @floor = floor
        @apartment = apartment

        checkRequiredFields('cityCode', 'firstLine')
    end
end
