require_relative('bosta/config.rb')
require_relative('bosta/resource.rb')
require_relative('bosta/cities/City.rb')
require_relative('bosta/zones/Zone.rb')
require_relative('bosta/deliveries/Delivery.rb')
require_relative('bosta/pickups/Pickup.rb')
require_relative('bosta/utils/BostaObject.rb')
require_relative('bosta/utils/Address.rb')
require_relative('bosta/utils/Specs.rb')
require_relative('bosta/utils/Receiver.rb')
require_relative('bosta/utils/ContactPerson.rb')
require_relative('bosta/utils/constants.rb')

#= Bosta
#
#* Create and list shimpents easily using Delivery
#* Create and list your pickups using Pickup
#* List Different cities that we cover using City
#* List all zones that we cover using Zone
#
#== Start with bosta
#
#Visit https://bosta.co/
#

module Bosta  
    Bosta.baseUrl = 'https://app.bosta.co' #Default baseUrl
end