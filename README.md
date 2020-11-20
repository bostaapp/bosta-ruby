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
create_delivery = Bosta::Delivery.create(type, 100, receiver1, address1,  spec)

delivery_id = create_delivery['_id'];
tracking_number = create_delivery['trackingNumber'];
```
###### update shipment by id
```bash
update_delivery = Bosta::Delivery.update(delivery_id, cod=nil, address= nil, receiver = nil, business_reference=nil, webhook_url=nil, notes=nil);
```
###### list all created shipments
```bash
deliveries = Bosta::Delivery.find_all_deliveries();
```
###### get shipment by tracking number
```bash
delivery = Bosta::Delivery.find_delivery_by_traking_number(tracking_number);
```
###### track shipment
```bash
tracking_history = Bosta::Delivery.track_delivery(tracking_number);
```
###### print airwayBill
```bash
airwayBill = Bosta::Delivery.print_delivery_awb(delivery_id);
```
###### terminate delivery
```bash
Bosta::Delivery.terminate_delivery(delivery_id);
```

##### pickups
###### get your pickup location
```bash
pickup_locations = Bosta::Pickup.find_pickup_locations();
business_location_id = pickup_locations["pickupLocations"][0]['_id'];
```
###### create pickup
```bash
create_pickup = Bosta::Pickup.create(business_location_id, scheduled_date, scheduled_time_slot, contact_person);
```
###### update pickup
```bash
update_pickup = Bosta::Pickup.update(pickup_id, business_location_id=nil, scheduled_date=nil, scheduled_time_slot=nil, contact_person=nil, notes=nil);
```
###### get all pickups
```bash
pickup_requests = Bosta::Pickup.find_pickups();
```
###### get pickup by id
```bash
pikcup_request = Bosta::Pickup.find_pickup_by_id(pickup_id);
```
###### delete pickup
```bash
Bosta::Pickup.delete_pickup(pickup_id);
```

##### cities
###### get all cities to select one of them and its code in shipment
```bash
cities = Bosta::City.find_all_cities();
```

##### zones
###### get zones of the city by city id to use one of them in the shipment
```bash
zones = Bosta::City.show_city_zones(city_id);
```

## Contribution

We are open to, and grateful for, any contributions made by the community.
By contributing to Bosta, you agree to abide by the code of conduct.
- [Contributing Guide](CONTRIBUTING.md) 
- [Code of Conduct](CODE_OF_CONDUCT.md)

## License

The MIT License (MIT) [License](LICENSE).
