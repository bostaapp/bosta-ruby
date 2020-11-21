# frozen_string_literal: true

require 'bosta'
require 'date'

Bosta.api_key = ENV['API_KEY']
Bosta.base_url = ENV['BASE_URL']

#
# * get all your created pickups
#

puts 'Get all pickups'

my_pickups = Bosta::Pickup.find_pickups
puts my_pickups

#
# * retrieve specific pickup using +pickupId+ -> '070000000342'
#

puts 'Get pickup by id'

pickup = Bosta::Pickup.find_pickup_by_id '070000000342'

puts pickup

#
# * get all your pickup locations that you will use in creating pickups
#

puts 'Get all pickup locations'
my_pickups = Bosta::Pickup.find_pickup_locations
business_location_id = my_pickups['pickupLocations'][0]['_id']

puts business_location_id

#=== Create A new pickup
# * +business_location_id+ should be on of your business locations ids
# * +scheduled_date+ is the date to be scheduled for pickup
# * +scheduled_time_slot+ should be one of TIME_SLOT_10_TO_13, TIME_SLOT_13_TO_16 in Bosta
# * +contact_person+ should be of type ContactPerson
# * +notes+ (optional) String
#

puts 'Create Pickup Request'
scheduled_time_slot = Bosta::TIME_SLOT_13_TO_16
contact_person = Bosta::ContactPerson.new('Ahmed Mohamed', '01029393939')
scheduled_date = Date.new(2020, 11, 23)
created_pickup = Bosta::Pickup.create(business_location_id, scheduled_date, scheduled_time_slot, contact_person)

puts created_pickup

#=== Edit A created pickup
# * +pickupId+ the id of the pickup to be updated
# * +business_location_id+ (optional) should be on of your business locations ids
# * +scheduled_date+ (optional) is the date to be scheduled for pickup
# * +scheduled_time_slot+ (optional) should be one of TIME_SLOT_10_TO_13, TIME_SLOT_13_TO_16 in Bosta
# * +contact_person+ (optional) should be of type ContactPerson
# * +notes+ (optional) String
#

puts 'Update Pickup request'
new_date = Date.new(2020, 11, 25)
updated_pickup = Bosta::Pickup.update(created_pickup['_id'], business_location_id, new_date)

puts updated_pickup
