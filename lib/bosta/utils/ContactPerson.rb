require('./BostaObject.rb')

class ContactPerson < BostaObject
    attr_accessor :name, :phone, :email
    def initialize(name, phone, email)
        @name = name
        @phone = phone
        @email = email

        checkRequiredFields('name', 'phone')
    end
end