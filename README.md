## Bosta Ruby Package
The Bosta Ruby SDK provides convenient access to the Bosta API from applications written in the Ruby language.

- [Installation](#installation)
- [Usage](#usage)
- [Contribution](#contribution)
- [License](#license)

## Installation

```bash
gem install bosta
```

## Usage

#### Initiating Bosta Client
```bash
require('bosta');

Bosta.api_key= ENV['API_KEY']
Bosta.base_url= ENV['BASE_URL']
```

`API_KEY` is your integartion api key with bosta, to get an api key you must be registered, here is the registration link [Bosta](https://business.bosta.co/signup). And `BASE_URL` is the url to bosta Apis wheither it's [staging](https://stg-app.bosta.co) or [production](https://app.bosta.co). If `BASE_URL` is not sent in initialization as parameter it's [production](https://app.bosta.co) by default.

#### Use initiated bosta client to do the functionality of the following

##### list utilities

###### delivery types to use in shipment creation
```bash
deliveryTypes = Bosta::DELIVERY_TYPES;
```
###### pickup timeslots to use in pickup creation
```bash
pickupTimeSlots_1 = Bosta::TIME_SLOT_10_TO_13;
pickupTimeSlots_2 = Bosta::TIME_SLOT_13_TO_16;
```

##### Shipments
###### created shipment
```bash
receiver1 = Bosta::Receiver.new('Ahmad Mohamad', '01029394959')
address1 = Bosta::Address.new('EG-01', 'address firstline')
type = Bosta::DELIVERY_TYPES[:SEND]
spec = Bosta::Specs.new(Bosta::DELIVERY_SIZES[:SMALL])
createdDelivery = Bosta::Delivery.create(type, 100, receiver1, address1,  spec)

deliveryId = createdDelivery['_id'];
trackingNumber = createdDelivery['trackingNumber'];
```
###### update shipment by id
```bash
updatedDeliver = Bosta::Delivery.update(deliveryId, cod=nil, dropOffAddress= nil, receiver = nil, pickupAddress=nil, businessReference=nil, webhookUrl=nil, notes=nil);
```
###### list all created shipments
```bash
deliveries = Bosta::Delivery.find_all_deliveries();
```
###### get shipment by tracking number
```bash
delivery = Bosta::Delivery.find_delivery_by_traking_number(trackingNumber);
```
###### track shipment
```bash
trackingHistory = Bosta::Delivery.track_delivery(trackingNumber);
```
###### print airwayBill
```bash
airwayBill = Bosta::Delivery.print_delivery_awb(deliveryId);
```
###### terminate delivery
```bash
Bosta::Delivery.terminate_delivery(deliveryId);
```

##### pickups
###### get your pickup location
```bash
pickupLocations = Bosta::Pickup.find_pickup_locations();
business_location_id = pickupLocations["pickupLocations"][0]['_id'];
```
###### create pickup
```bash
createdPickup = Bosta::Pickup.create(business_location_id, scheduled_date, scheduled_time_slot, contact_person);
```
###### update pickup
```bash
updatedPickup = Bosta::Pickup.update(pickupId, business_location_id=nil, scheduled_date=nil, scheduled_time_slot=nil, contact_person=nil, notes=nil);
```
###### get all pickups
```bash
pickupRequests = Bosta::Pickup.find_pickups();
```
###### get pickup by id
```bash
pikcupRequest = Bosta::Pickup.find_pickup_by_id(pickupId);
```
###### delete pickup
```bash
Bosta::Pickup.delete_pickup(pickupId);
```

##### cities
###### get all cities to select one of them and its code in shipment
```bash
cities = Bosta::City.find_all_cities();
```

##### zones
###### get zones of the city by city id to use one of them in the shipment
```bash
zones = Bosta::City.show_city_zones(cityId);
```

## Contribution

We are open to, and grateful for, any contributions made by the community.
By contributing to Bosta, you agree to abide by the code of conduct.
- [Contributing Guide](CONTRIBUTING.md) 
- [Code of Conduct](CODE_OF_CONDUCT.md)

## License

The MIT License (MIT) [License](LICENSE).
