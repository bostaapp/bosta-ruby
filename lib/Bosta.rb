require('./bosta/config.rb')
require('./bosta/resource.rb')
require('./bosta/cities/City.rb')
require('./bosta/zones/Zone.rb')
require('./bosta/deliveries/Delivery.rb')
require('./bosta/pickups/Pickup.rb')
require('./bosta/utils/BostaObject.rb')
require('./bosta/utils/Address.rb')
require('./bosta/utils/Specs.rb')
require('./bosta/utils/Receiver.rb')
require('./bosta/utils/ContactPerson.rb')
require('./bosta/utils/constants.rb')
module Bosta  
    Bosta.baseUrl = 'https://dev-app.bosta.co' #Default baseUrl

    Bosta.baseUrl = 'http://localhost:3000' #Default baseUrl
end