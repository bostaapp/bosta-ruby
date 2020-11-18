module Bosta
    class Delivery 

        #=== Create new delivery
        #* +packageType+ should be on of DELIVERY_TYPES in Bosta module
        #* +cod+ should be 0 in case delivery type = CRP
        #* +address+ should be of type Address
        #* +receiver+ should be of type Receiver
        #* +specs+ (optinal) should be of type Specs
        #* +businessReference+ (optional) String
        #* +webhookUrl+ (optional) String url
        #* +notes+ String
        #

        def self.create(packageType, cod, receiver, address, specs=nil, businessReference=nil, webhookUrl=nil, notes=nil)
            deliveryHash = Delivery::formatParams(packageType, cod, receiver, address, specs, businessReference, webhookUrl, notes)
            puts deliveryHash
            Bosta::Resource.send('post', 'deliveries', deliveryHash)
        end

        #=== Edit delivery data
        #* +deliveryId+
        #* +cod+ (optional) the cash on delivery (number)
        #* +address+ should be of type Address
        #* +receiver+ (optional) should be of type Receiver
        #* +businessReference+ (optional) String
        #* +webhookUrl+ (optional) String url
        #* +notes+ String
        #

        def self.update(deliveryId, cod=nil, address= nil, receiver = nil, businessReference=nil, webhookUrl=nil, notes=nil)
            deliveryHash = Delivery::formatParams(nil, cod, receiver, address, nil, businessReference, webhookUrl, notes)
            Bosta::Resource.send('put', "deliveries/#{deliveryId}", deliveryHash)
        end

        #
        #* Get all your created Deliveries
        #

        def self.getAllDeliveries
            Bosta::Resource.send('get', 'deliveries')
        end

        #
        #* Get specific delivery using +trackingNumber+
        #

        def self.getDeliveryByTrakingNumber(trackingNumber)
            Bosta::Resource.send('get', "deliveries/#{trackingNumber}")
        end

        #
        #* see delivery tracking using +trackingNumber+
        #

        def self.trackDelivery(trackingNumber)
            Bosta::Resource.send('get', "deliveries/#{trackingNumber}/tracking")
        end

        #
        #* get base64 pdf data representing the package using +deliveryId+
        #

        def self.printDeliveryAWB(deliveryId)
            Bosta::Resource.send('get', "deliveries/awb/#{deliveryId}")
        end

        #
        #* Cancel the shipment +deliveryId+
        #

        def self.terminateDelivery(deliveryId)
            Bosta::Resource.send('delete', "deliveries/#{deliveryId}")
        end


        #:nodoc: all
        def self.formatParams(packageType=nil, cod=nil, receiver=nil, address=nil, specs=nil, businessReference=nil, webhookUrl=nil, notes=nil)
            
            raise 'receiver should be of Class Bosta::Receiver' if !receiver.instance_of?(Bosta::Receiver) && !receiver.nil?
            raise 'address should be of Class Bosta::Address' if !address.instance_of?(Bosta::Address) && !address.nil?
            raise 'specs should be of Class Bosta::Specs' if !specs.instance_of?(Bosta::Specs) && !specs.nil?
            deliveryHash = {}
            unless (address.nil?) 
                forwardTypes = [Bosta::DELIVERY_TYPES[:SEND], Bosta::DELIVERY_TYPES[:EXCHANGE]]
                deliveryHash[:pickupAddress] = address.getFormattedObj unless forwardTypes.include? packageType
                deliveryHash[:dropOffAddress] = address.getFormattedObj if forwardTypes.include?(packageType)
            end
            deliveryHash[:receiver] = receiver.getFormattedObj unless receiver.nil?
            deliveryHash[:cod] = cod unless cod.nil?
            deliveryHash[:businessReference] = businessReference unless businessReference.nil?
            deliveryHash[:webhookUrl] = webhookUrl unless webhookUrl.nil?
            deliveryHash[:notes] = notes unless notes.nil?
            deliveryHash[:specs] = specs.getFormattedObj unless specs.nil?
            deliveryHash[:type] = packageType unless packageType.nil?
            
            return deliveryHash
        end
    end
end