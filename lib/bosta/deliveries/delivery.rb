# frozen_string_literal: true

module Bosta
  # Find, create, update, and delete deliveries
  class Delivery
    #=== Create new delivery
    # * +package_type+ should be on of DELIVERY_TYPES in Bosta module
    # * +cod+ should be 0 in case delivery type = CRP
    # * +address+ should be of type Address
    # * +receiver+ should be of type Receiver
    # * +specs+ (optinal) should be of type Specs
    # * +business_reference+ (optional) String
    # * +webhook_url+ (optional) String url
    # * +notes+ String
    #

    def self.create(package_type,
                    cod,
                    receiver,
                    address,
                    specs = nil,
                    business_reference = nil,
                    webhook_url = nil,
                    notes = nil)
      params_hash = {
        type: package_type,
        cod: cod,
        address: address,
        receiver: receiver,
        businessReference: business_reference,
        specs: specs,
        webhookUrl: webhook_url,
        notes: notes
      }
      delivery_hash = Delivery.format_params(params_hash)
      Bosta::Resource.send('post', 'deliveries', delivery_hash)
    end

    #=== Edit delivery data
    # * +delivery_id+
    # * +cod+ (optional) the cash on delivery (number)
    # * +address+ (optional) should be of type Address
    # * +receiver+ (optional) should be of type Receiver
    # * +business_reference+ (optional) String
    # * +webhook_url+ (optional) String url
    # * +notes+ (optional) String
    #

    def self.update(delivery_id,
                    cod = nil,
                    address = nil,
                    receiver = nil,
                    business_reference = nil,
                    webhook_url = nil,
                    notes = nil)
      params_hash = {
        cod: cod,
        address: address,
        receiver: receiver,
        businessReference: business_reference,
        webhookUrl: webhook_url,
        notes: notes
      }
      delivery_hash = Delivery.format_params(params_hash)
      Bosta::Resource.send('put', "deliveries/#{delivery_id}", delivery_hash)
    end

    #
    # * Get all your created Deliveries
    #

    def self.find_all_deliveries
      Bosta::Resource.send('get', 'deliveries')
    end

    #
    # * Get specific delivery using +tracking_number+
    #

    def self.find_delivery_by_traking_number(tracking_number)
      Bosta::Resource.send('get', "deliveries/#{tracking_number}")
    end

    #
    # * see delivery tracking using +tracking_number+
    #

    def self.track_delivery(tracking_number)
      Bosta::Resource.send('get', "deliveries/#{tracking_number}/tracking")
    end

    #
    # * get base64 pdf data representing the package using +delivery_id+
    #

    def self.print_delivery_awb(delivery_id)
      Bosta::Resource.send('get', "deliveries/awb/#{delivery_id}")
    end

    #
    # * Terminate the shipment +delivery_id+
    #

    def self.terminate_delivery(delivery_id)
      Bosta::Resource.send('delete', "deliveries/#{delivery_id}")
    end

    #:nodoc: all
    def self.format_params(params_hash)
      params_hash = Delivery.check_objects_types(params_hash)
      delivery_hash = {}
      params_hash.each do |key, value|
        if key == :address && !value.nil?
          forward_types = [Bosta::DELIVERY_TYPES[:SEND], Bosta::DELIVERY_TYPES[:EXCHANGE]]
          delivery_hash[:pickupAddress] = value unless forward_types.include? params_hash[:type]
          delivery_hash[:dropOffAddress] = value if forward_types.include? params_hash[:type]
        else
          delivery_hash[key] = value
        end
      end
      delivery_hash
    end

    #:nodoc: all
    def self.check_objects_types(params_hash)
      object_strings = %w[receiver address specs]

      object_strings.each do |string|
        upper_string = string[0].upcase + string[1..-1]
        bosta_object = Object.const_get("Bosta::#{upper_string}")
        next if params_hash[:"#{string}"].nil?
        unless params_hash[:"#{string}"].instance_of?(bosta_object)
          raise "#{string} should be of Class Bosta::#{upper_string}"
        end

        params_hash[:"#{string}"] = params_hash[:"#{string}"].format_obj
      end
      params_hash.compact
    end
  end
end
