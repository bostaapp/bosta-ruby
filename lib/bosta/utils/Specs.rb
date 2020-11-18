module Bosta
    class Specs < BostaObject
        attr_accessor :size, :itemsCount, :desc

        #=== Initialize Specs Object
        #* +size+ (optional) String
        #* +itemsCount+ (optional) String
        #* +desc+ (optional) String
        #
        def initialize(size=nil, itemsCount=nil, desc=nil)
            @size = size
            @itemsCount = itemsCount
            @description = desc
        end

        def getFormattedObj #:nodoc: all
            obj = {}
            packageDetails = {}
            obj[:size] = @size unless @size.nil?
            packageDetails[:itemsCount] = @itemsCount unless @itemsCount.nil?
            packageDetails[:description] = @description unless @description.nil?

            obj[:packageDetails] = packageDetails unless packageDetails.empty?
            return obj
        end 
    end
end