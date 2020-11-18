module Bosta

    ##
    # This class represents the citoes that your addresses will contain in creating deliveries and pickups.
    class City

        ##
        # Get all cities names and codes.
        #
        # Here you will find all city codes that you will need to provide in
        # creating shipments and pickups.
        #
        # An Error is raised if the endpoint didn't return data

        def self.getAllCities
            Bosta::Resource.send('get', 'cities')
        end

        ##
        # Get all zones in a specific city.
        #
        # +cityId+ represents the city id for which zones is obtained
        # an exception raises.
        #
        # An Error is raised if the endpoint didn't return data or wrong +cityId+ was given

        def self.showCityZones(cityId)
            Bosta::Resource.send('get', "cities/#{cityId}/zones")
        end
    end
end 