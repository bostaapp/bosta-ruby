module Bosta

    ##
    # This class represents the zones that your addresses will contain in creating deliveries and pickps.
    class Zone

        ##
        # Get all zones names.
        #
        # Here you will find all zones that you will need to provide in
        # creating shipments and pickps.
        #
        # An Error is raised if the endpoint didn't return data

        def self.getAllZones
            Bosta::Resource.send('get', 'zones')
        end

        ##
        # Get all zones in a specific city.
        #
        # +zoneId+ represents the id of the zone to be obtaines
        #
        # An Error is raised if the endpoint didn't return data or wrong +zoneId+ was given
        
        def self.showZone(zoneId)
            Bosta::Resource.send('get', "zones/#{zoneId}")
        end
    end
end 