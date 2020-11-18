module Bosta
    class Receiver < BostaObject
        attr_accessor :firstName, :lastName, :phone, :email

        #=== Initialize Receiver Object
        #* +name+
        #* +phone+ 
        #* +email+ (optional) String
        #
        def initialize(name, phone, email=nil)
            namesArr = name.split
            @firstName = namesArr.shift
            @lastName = namesArr.join(' ')
            @lastName = '-' if @lastName.empty?
            @phone = phone
            @email = email
            
            checkRequiredFields('firstName', 'phone')
        end
    end
end