require('./BostaObject.rb')

class Receiver < BostaObject
    attr_accessor :firstName, :lastName, :phone, :email
    def initialize(name, phone, email=nil)
        namesArr = name.split
        puts '    '.gsub(/\s+/, '').empty?
        @firstName = namesArr.shift
        @lastName = namesArr.join(' ')
        @lastName = '-' if @lastName.empty?
        @phone = phone
        @email = email
        
        checkRequiredFields('firstName', 'phone')
    end
end
