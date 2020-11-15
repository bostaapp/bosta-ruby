module Bosta
    class Delivery 
        def self.create(type, cod, dropOffAddress, receiver, pickupAddress=nil, specs=nil, businessReference=nil, webhookUrl=nil, notes=nil)
            deliveryHash = {
                :type => type,
                :cod => cod,
                :dropOffAddress => dropOffAddress,
                :receiver => receiver
            }
            
            deliveryHash[:pickupAddress] = pickupAddress unless pickupAddress.nil?
            deliveryHash[:specs] = specs unless specs.nil?
            deliveryHash[:businessReference] = businessReference unless businessReference.nil?
            deliveryHash[:webhookUrl] = webhookUrl unless webhookUrl.nil?
            deliveryHash[:notes] = notes unless notes.nil?
            
            Bosta::Resource.send('post', 'deliveries', deliveryHash)
        end

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

        def self.getAllDeliveries
            Bosta::Resource.send('get', 'deliveries')
        end

        def self.getDeliveryByTrakingNumber(trackingNumber)
            Bosta::Resource.send('get', "deliveries/#{trackingNumber}")
        end

        def self.trackDelivery(trackingNumber)
            Bosta::Resource.send('get', "deliveries/#{trackingNumber}/tracking")
        end

        def self.printDeliveryAWB(deliveryId)
            Bosta::Resource.send('get', "deliveries/awb/#{deliveryId}")
        end

        def self.terminateDelivery(deliveryId)
            Bosta::Resource.send('delete', "deliveries/#{deliveryId}")
        end
    end
end