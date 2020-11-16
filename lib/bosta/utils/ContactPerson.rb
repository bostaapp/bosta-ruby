module Bosta
    class ContactPerson < BostaObject
        attr_accessor :name, :phone, :email
        def initialize(name, phone, email = nil)
            @name = name
            @phone = phone
            @email = email

            checkRequiredFields('name', 'phone')
        end
    end
end