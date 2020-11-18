
module Bosta
        class Address < BostaObject
        attr_accessor :cityCode, :zone, :firstLine, :secondLine, :district, :buildingNumber, :floor, :apartment

        #=== Initialize Address Object
        #* +cityCode+ The city code like 'EG-01', you can get all cities codes from City Class
        #* +firstLine+ your address firstline
        #* +zone+ (optional), find all zones in a city thorugh the City Class
        #* +secondLine+ (optional) Sring
        #* +buildingNumber+ (optional) String
        #* +floor+ (optional) String
        #* +apartment+ (optional) String
        #
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
end
