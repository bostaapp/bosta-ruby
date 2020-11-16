module Bosta
    class Pickup 

        #=== Create A new pickup
        #* +businessLocationId+ should be on of your business locations ids
        #* +scheduledDate+ is the date to be scheduled for pickup
        #* +scheduledTimeSlot+ should be one of TIME_SLOT_10_TO_13, TIME_SLOT_13_TO_16 in Bosta
        #* +contactPerson+ should be of type ContactPerson
        #* +notes+ (optional) String
        #

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

        #=== Edit A created pickup
        #* +pickupId+ the id of the pickup to be updated
        #* +businessLocationId+ (optional) should be on of your business locations ids
        #* +scheduledDate+ (optional) is the date to be scheduled for pickup
        #* +scheduledTimeSlot+ (optional) should be one of TIME_SLOT_10_TO_13, TIME_SLOT_13_TO_16 in Bosta
        #* +contactPerson+ (optional) should be of type ContactPerson
        #* +notes+ (optional) String
        #

        def self.update(pickupId, businessLocationId=nil, scheduledDate=nil, scheduledTimeSlot=nil, contactPerson=nil, notes=nil)
            pickupHash = {}
            
            pickupHash[:businessLocationId] = businessLocationId unless businessLocationId.nil?
            pickupHash[:scheduledDate] = scheduledDate unless scheduledDate.nil?
            pickupHash[:scheduledTimeSlot] = scheduledTimeSlot unless scheduledTimeSlot.nil?
            pickupHash[:contactPerson] = contactPerson unless contactPerson.nil?
            pickupHash[:notes] = notes unless notes.nil?
            
            Bosta::Resource.send('put', "pickups/#{pickupId}", pickupHash)
        end

        #
        #* get all your pickup locations that you will use in creating pickups
        #

        def self.getPickupLocations
            Bosta::Resource.send('get', 'pickup-locations')
        end

        #
        #* get all your created pickups
        #

        def self.getPickups(pageId=0)
            Bosta::Resource.send('get', "pickups", {}, {:pageId => pageId})
        end

        #
        #* retrieve specific pickup using +pickupId+
        #

        def self.getPickupById(pickupId)
            Bosta::Resource.send('get', "pickups/#{pickupId}")
        end

        #
        #* delete specific pickup using +pickupId+
        #

        def self.deletePickup(pickupId)
            Bosta::Resource.send('delete', "pickups/#{pickupId}")
        end
    end
end