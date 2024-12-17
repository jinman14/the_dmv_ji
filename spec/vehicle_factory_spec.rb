require 'spec_helper'
require 'pry'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    describe '#initialize' do
        it 'is an instance of a vehicle factory class' do
            expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end

    describe '#cars is an array' do
        it 'can put the new vehicle into the cars array' do
            expect(@factory.cars).to eq([])

            @factory.create_vehicles(@wa_ev_registrations)

            expect(@factory.cars[0].engine).to eq(:ev)
            expect(@factory.cars.length).to eq(1000)
        end
    end

    describe '#create_vehicles' do
        it 'can check added vehicles created' do
            @factory.create_vehicles(@wa_ev_registrations)
            
            expect(@factory.cars[0].vin).to eq("WBY8P8C51K")
            expect(@factory.cars[0].make).to eq("BMW")
            expect(@factory.cars[0].model).to eq("i3")
            expect(@factory.cars[0].year).to eq("2019")

            expect(@factory.cars[1].vin).to eq("3FMTK4SE2P")
            expect(@factory.cars[1].make).to eq("FORD")
            expect(@factory.cars[1].model).to eq("Mustang Mach-E")
            expect(@factory.cars[1].year).to eq("2023")

            expect(@factory.cars[2].vin).to eq("5YJ3E1EAXK")
            expect(@factory.cars[2].make).to eq("TESLA")
            expect(@factory.cars[2].model).to eq("Model 3")
            expect(@factory.cars[2].year).to eq("2019")
        end
    end
end