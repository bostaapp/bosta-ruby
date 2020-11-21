# frozen_string_literal: true

module Bosta
  # Find, create, update, and delete pickups
  class Pickup
    #=== Create A new pickup
    # * +business_location_id+ should be on of your business locations ids
    # * +scheduled_date+ is the date to be scheduled for pickup
    # * +scheduled_time_slot+ should be one of TIME_SLOT_10_TO_13, TIME_SLOT_13_TO_16 in Bosta
    # * +contact_person+ should be of type ContactPerson
    # * +notes+ (optional) String
    #

    def self.create(business_location_id, scheduled_date, scheduled_time_slot, contact_person, notes = nil)
      unless contact_person.instance_of?(Bosta::ContactPerson)
        raise 'contact_person should be of Class Bosta::ContactPerson'
      end

      pickup_hash = {
        businessLocationId: business_location_id,
        scheduledDate: scheduled_date,
        scheduledTimeSlot: scheduled_time_slot,
        contactPerson: contact_person.format_obj
      }

      pickup_hash[:notes] = notes unless notes.nil?

      Bosta::Resource.send('post', 'pickups', pickup_hash)
    end

    #=== Edit A created pickup
    # * +pickup_id+ the id of the pickup to be updated
    # * +business_location_id+ (optional) should be on of your business locations ids
    # * +scheduled_date+ (optional) is the date to be scheduled for pickup
    # * +scheduled_time_slot+ (optional) should be one of TIME_SLOT_10_TO_13, TIME_SLOT_13_TO_16 in Bosta
    # * +contact_person+ (optional) should be of type ContactPerson
    # * +notes+ (optional) String
    #

    def self.update(pickup_id, business_location_id = nil,
                    scheduled_date = nil,
                    scheduled_time_slot = nil,
                    contact_person = nil,
                    notes = nil)

      unless contact_person.nil?
        unless contact_person.instance_of?(Bosta::ContactPerson)
          raise 'contact_person should be of Class Bosta::ContactPerson'
        end

        contact_person = contact_person.format_obj
      end
      pickup_hash = {
        businessLocationId: business_location_id,
        scheduledDate: scheduled_date,
        scheduledTimeSlot: scheduled_time_slot,
        contactPerson: contact_person,
        notes: notes
      }

      pickup_hash = pickup_hash.compact
      Bosta::Resource.send('put', "pickups/#{pickup_id}", pickup_hash)
    end

    #
    # * get all your pickup locations that you will use in creating pickups
    #

    def self.find_pickup_locations
      Bosta::Resource.send('get', 'pickup-locations')
    end

    #
    # * get all your created pickups
    #

    def self.find_pickups(page_id = 0)
      Bosta::Resource.send('get', 'pickups', {}, { pageId: page_id })
    end

    #
    # * retrieve specific pickup using +pickup_id+
    #

    def self.find_pickup_by_id(pickup_id)
      Bosta::Resource.send('get', "pickups/#{pickup_id}")
    end

    #
    # * delete specific pickup using +pickup_id+
    #

    def self.delete_pickup(pickup_id)
      Bosta::Resource.send('delete', "pickups/#{pickup_id}")
    end
  end
end
