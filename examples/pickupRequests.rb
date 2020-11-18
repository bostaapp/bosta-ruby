require 'bosta'
require 'date'

Bosta.apiKey = ENV['API_KEY']
Bosta.baseUrl = ENV['BASE_URL']


#
#* get all your created pickups
#

puts 'Get all pickups'

myPickups = Bosta::Pickup.getPickups
puts myPickups

070000000342

#
#* retrieve specific pickup using +pickupId+ -> '070000000342'
#

puts 'Get pickup by id'

pickup = Bosta::Pickup.getPickupById '070000000342'

puts pickup


#
#* get all your pickup locations that you will use in creating pickups
#

puts 'Get all pickup locations'
myPickups = Bosta::Pickup.getPickupLocations
businessLocationId = myPickups["pickupLocations"][0]['_id'];

puts businessLocationId



#=== Create A new pickup
#* +businessLocationId+ should be on of your business locations ids
#* +scheduledDate+ is the date to be scheduled for pickup
#* +scheduledTimeSlot+ should be one of TIME_SLOT_10_TO_13, TIME_SLOT_13_TO_16 in Bosta
#* +contactPerson+ should be of type ContactPerson
#* +notes+ (optional) String
#

puts 'Create Pickup Request'
scheduledTimeSlot = Bosta::TIME_SLOT_13_TO_16
contactPerson = Bosta::ContactPerson.new('Ahmed Mohamed', '01029393939')
scheduledDate = Date.new(2020,11,23)
createdPickup = Bosta::Pickup.create(businessLocationId, scheduledDate, scheduledTimeSlot, contactPerson);

puts createdPickup



#=== Edit A created pickup
#* +pickupId+ the id of the pickup to be updated
#* +businessLocationId+ (optional) should be on of your business locations ids
#* +scheduledDate+ (optional) is the date to be scheduled for pickup
#* +scheduledTimeSlot+ (optional) should be one of TIME_SLOT_10_TO_13, TIME_SLOT_13_TO_16 in Bosta
#* +contactPerson+ (optional) should be of type ContactPerson
#* +notes+ (optional) String
#

puts 'Update Pickup request'
newDate = Date.new(2020,11,25)
updatedPickup = Bosta::Pickup.update(createdPickup['_id'], businessLocationId, newDate)


puts updatedPickup