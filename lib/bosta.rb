# frozen_string_literal: true

require_relative('bosta/config')
require_relative('bosta/resource')
require_relative('bosta/utils/bosta_object')
require_relative('bosta/utils/address')
require_relative('bosta/utils/specs')
require_relative('bosta/utils/receiver')
require_relative('bosta/utils/contact_person')
require_relative('bosta/utils/constants')
require_relative('bosta/cities/city')
require_relative('bosta/zones/zone')
require_relative('bosta/deliveries/delivery')
require_relative('bosta/pickups/pickup')

#= Bosta
#
# * Create and list shimpents easily using Delivery
# * Create and list your pickups using Pickup
# * List Different cities that we cover using City
# * List all zones that we cover using Zone
#
#== Start with bosta
#
# Visit https://bosta.co/
#
module Bosta
  Bosta.base_url = 'https://app.bosta.co' # Default base_url
end
