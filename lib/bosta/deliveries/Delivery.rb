module Bosta
    class Delivery 

        #=== Create A new pickup
        #* +type+ should be on of DELIVERY_TYPES in Bosta module
        #* +cod+ should be 0 in case delivery type = CRP
        #* +address+ 
        #* +receiver+ should be of type Receiver
        #* +specs+ (optinal) should be of type Specs
        #* +businessReference+ (optional) String
        #* +webhookUrl+ (optional) String url
        #* +notes+ String
        #

        def self.create(type, cod, receiver, address, specs=nil, businessReference=nil, webhookUrl=nil, notes=nil)
            deliveryHash = {
                :type => type,
                :cod => cod,
                :receiver => receiver
            }
            forwardTypes = [Bosta::DELIVERY_TYPES[:SEND], Bosta::DELIVERY_TYPES[:EXCHANGE]]
            deliveryHash[:pickupAddress] = address unless forwardTypes.include? type
            deliveryHash[:dropOffAddress] = address if forwardTypes.include? type
            deliveryHash[:specs] = specs unless specs.nil?
            deliveryHash[:businessReference] = businessReference unless businessReference.nil?
            deliveryHash[:webhookUrl] = webhookUrl unless webhookUrl.nil?
            deliveryHash[:notes] = notes unless notes.nil?
            
            Bosta::Resource.send('post', 'deliveries', deliveryHash)
        end

        #=== Edit Delivery
        #* +deliveryId+
        #* +cod+ (optional) the cash on delivery (number)
        #* +dropOffAddress+ (optional) should be of type Address
        #* +receiver+ (optional) should be of type Receiver
        #* +pickupAddress+ (optional) (optinal) should be of type Address
        #* +businessReference+ (optional) String
        #* +webhookUrl+ (optional) String url
        #* +notes+ String
        #

        def self.update(deliveryId, cod=nil, dropOffAddress= nil, receiver = nil, pickupAddress=nil, businessReference=nil, webhookUrl=nil, notes=nil)
            deliveryHash = {}
            
            deliveryHash[:cod] = cod unless cod.nil?
            deliveryHash[:dropOffAddress] = dropOffAddress unless dropOffAddress.nil?
            deliveryHash[:receiver] = receiver unless receiver.nil?
            deliveryHash[:pickupAddress] = pickupAddress unless pickupAddress.nil?
            deliveryHash[:businessReference] = businessReference unless businessReference.nil?
            deliveryHash[:webhookUrl] = webhookUrl unless webhookUrl.nil?
            deliveryHash[:notes] = notes unless notes.nil?
            
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
    end
end