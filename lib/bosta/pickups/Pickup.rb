module Bosta
    class Pickup 
        def self.create(businessLocationId, scheduledDate, scheduledTimeSlot, contactPerson, notes=nil)
            pickupHash = {
                :businessLocationId => businessLocationId,
                :scheduledDate => scheduledDate,
                :scheduledTimeSlot => scheduledTimeSlot,
                :contactPerson => contactPerson
            }
            
            pickupHash[:notes] = notes unless notes.nil?
            
            Bosta::Resource.send('post', 'pickups', pickupHash)
        end

        def self.update(pickupId, businessLocationId=nil, scheduledDate=nil, scheduledTimeSlot=nil, contactPerson=nil, notes=nil)
            pickupHash = {}
            
            pickupHash[:businessLocationId] = businessLocationId unless businessLocationId.nil?
            pickupHash[:scheduledDate] = scheduledDate unless scheduledDate.nil?
            pickupHash[:scheduledTimeSlot] = scheduledTimeSlot unless scheduledTimeSlot.nil?
            pickupHash[:contactPerson] = contactPerson unless contactPerson.nil?
            pickupHash[:notes] = notes unless notes.nil?
            
            Bosta::Resource.send('put', "pickups/#{pickupId}", pickupHash)
        end

        def self.getPickupLocations
            Bosta::Resource.send('get', 'pickup-locations')
        end

        def self.getPickups(pageId=0)
            Bosta::Resource.send('get', "pickups", {}, {:pageId => pageId})
        end

        def self.getPickupById(pickupId)
            Bosta::Resource.send('get', "pickups/#{pickupId}")
        end

        def self.deletePickup(pickupId)
            Bosta::Resource.send('delete', "pickups/#{pickupId}")
        end
    end
end