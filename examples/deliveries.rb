# frozen_string_literal: true

require 'bosta'

Bosta.api_key = ENV['API_KEY']
Bosta.base_url = ENV['BASE_URL']

#
# Get all your created Deliveries
#

puts 'Get All Delivery'

my_deliveries = Bosta::Delivery.find_all_deliveries
puts my_deliveries

#
# Get specific delivery using +trackingNumber+ -> 7414938
#

puts 'Get One delivery using tracking number'

get_one_delivery = Bosta::Delivery.find_delivery_by_traking_number '7414938'
puts get_one_delivery

#
# see delivery tracking using +trackingNumber+ -> 7414938
#

puts 'Track an order'

track_order = Bosta::Delivery.track_delivery '7414938'
puts track_order

#
# get base64 pdf data representing the package using +delivery_id+ ->
#
puts 'Printing Awb for an order'

# awb = Bosta::Delivery.print_delivery_awb 'f5lrOZgkyq'
# puts awb

#
# Terminate shipment +delivery_id+
# the shimpent must be in its initial state to
# be able to terminate it
#

puts 'Terminating order'

# terminated_order = Bosta::Delivery.terminate_delivery 'f5lrOZgkyq'
# puts terminated_order

#=== Create new delivery
# * +packageType+ should be on of DELIVERY_TYPES in Bosta module
# * +cod+ should be 0 in case delivery type = CRP
# * +address+ should be of type Address
# * +receiver+ should be of type Receiver
# * +specs+ (optinal) should be of type Specs
# * +businessReference+ (optional) String
# * +webhookUrl+ (optional) String url
# * +notes+ String
#

puts 'Creating new Delivery'

receiver = Bosta::Receiver.new('Ahmad Mohamad', '01029394959')
address = Bosta::Address.new('EG-01', 'address firstline')
type = Bosta::DELIVERY_TYPES[:SEND]
spec = Bosta::Specs.new(Bosta::DELIVERY_SIZES[:SMALL])
created_delivery = Bosta::Delivery.create(type, 50, receiver, address, spec)

delivery_id = created_delivery['_id']

puts delivery_id

#=== Edit delivery data
# * +delivery_id+
# * +cod+ (optional) the cash on delivery (number)
# * +address+ (optional) should be of type Address
# * +receiver+ (optional) should be of type Receiver
# * +businessReference+ (optional) String
# * +webhookUrl+ (optional) String url
# * +notes+ (optional) String
#

puts 'Updating new Delivery'

updated_order = Bosta::Delivery.update(delivery_id, 100)
puts updated_order
