require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
    it 'exists and says attributes' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        expect(vehicle).to be_instance_of(Vehicle)
        expect(vehicle.year).to eq("2001")
        expect(vehicle.make).to eq("Honda")
        expect(vehicle.model).to eq("Civic")
        expect(vehicle.passengers).to eq([])
    end
    it 'methods work' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        expect(vehicle.speeding?).to eq(false)
        vehicle.speed
        expect(vehicle.speeding?).to eq(true)
    end
    it 'adds passenger and check if adult' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        jude = Passenger.new({"name" => "Jude", "age" => 20})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})
        vehicle.add_passenger(charlie)   
        vehicle.add_passenger(jude)  
        vehicle.add_passenger(taylor)
        expect(vehicle.passengers).to include(Passenger)
        expect(vehicle.num_adults).to eq(2)
    end
end