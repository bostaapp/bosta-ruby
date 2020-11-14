module Bosta
    class City
        def self.getAllCities
            Bosta::Resource.send('get', 'cities')
        end

        def self.showCityZones(cityId)
            Bosta::Resource.send('get', "cities/#{cityId}/zones")
        end
    end
end 