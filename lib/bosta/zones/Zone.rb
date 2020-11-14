module Bosta
    class Zone
        def self.getAllZones
            Bosta::Resource.send('get', 'zones')
        end

        def self.showZone(zoneId)
            Bosta::Resource.send('get', "zones/#{zoneId}")
        end
    end
end 