# frozen_string_literal: true

module Bosta
  ##
  # This class represents the zones that your addresses will contain in creating deliveries and pickups.
  class Zone
    ##
    # Get all zones names.
    #
    # Here you will find all zones that you will need to provide in
    # creating shipments and pickups.
    #
    # An Error is raised if the endpoint didn't return data

    def self.find_all_zones
      Bosta::Resource.send('get', 'zones')
    end

    ##
    # Get all zones in a specific city.
    #
    # +zone_id+ represents the id of the zone to be obtaines
    #
    # An Error is raised if the endpoint didn't return data or wrong +zone_id+ was given

    def self.show_zone(zone_id)
      Bosta::Resource.send('get', "zones/#{zone_id}")
    end
  end
end
