require 'bosta'

Bosta.apiKey = ENV['API_KEY']
Bosta.baseUrl = ENV['BASE_URL']

#
# Get all your created Deliveries
#

puts 'Get All Delivery'

myDeliveries = Bosta::Delivery.getAllDeliveries
puts myDeliveries

#
# Get specific delivery using +trackingNumber+ -> 7414938
#

puts 'Get One delivery using tracking number'

getOneDeliverey = Bosta::Delivery.getDeliveryByTrakingNumber 7414938
puts getOneDeliverey



#
# see delivery tracking using +trackingNumber+ -> 7414938
#

puts 'Track an order'

trackedOrder = Bosta::Delivery.trackDelivery 7414938
puts trackedOrder


#
# get base64 pdf data representing the package using +deliveryId+ -> 
#
puts 'Printing Awb for an order'

awb = Bosta::Delivery.printDeliveryAWB 'f5lrOZgkyq'
puts awb


#
# Terminate shipment +deliveryId+
# the shimpent must be in its initial state to
# be able to terminate it
#

puts 'Terminating order'

terminatedOrder = Bosta::Delivery.terminateDelivery 'f5lrOZgkyq'
puts terminatedOrder


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

puts 'Creating new Delivery'

receiver = Bosta::Receiver.new('Ahmad Mohamad', '01029394959')
address = Bosta::Address.new('EG-01', 'address firstline')
type = Bosta::DELIVERY_TYPES[:SEND]
spec = Bosta::Specs.new(Bosta::DELIVERY_SIZES[:SMALL])
createdDelivery = Bosta::Delivery.create(type, 50, receiver, address,  spec)

deliveryId = createdDelivery['_id'];
trackingNumber = createdDelivery['trackingNumber'];

puts deliveryId


#=== Edit delivery data
#* +deliveryId+
#* +cod+ (optional) the cash on delivery (number)
#* +address+ (optional) should be of type Address
#* +receiver+ (optional) should be of type Receiver
#* +businessReference+ (optional) String
#* +webhookUrl+ (optional) String url
#* +notes+ (optional) String
#

puts 'Updating new Delivery'

updatedOrder = Bosta::Delivery.update(deliveryId, 100)
puts updatedOrder