require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#registered_vehicles' do
    it 'can check registered vehicles' do
      expect(@facility_1.registered_vehicles).to eq([])
    end
  end

  describe '#collected_fees' do
    it 'can count collected fees' do
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#register_vehicle(vehicle)' do
    it 'can register a vehicle' do
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end
  end

  describe '#registration_date' do
    it 'it can tell the registration date as today' do
      expect(@cruz.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
    end
  end

  describe '#plate_type' do
    it 'can tell plate type' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)

      expect(@cruz.plate_type).to eq(:regular)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@camaro.plate_type).to eq(:antique)
    end
  end

  describe '#collected_fees' do
    it 'can calculate a facilities collected fees' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe 'second vehicle checks' do
    it 'can check another vehicle at a facility' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt, @camaro])

      expect(@bolt.registration_date).to eq(Date.today)
    end
  end

  describe 'check facility 2' do
    it 'can ensure facility 2 is still empty' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])

      # @facility_2.register_vehicle(@bolt)

      # expect(@facility_2.registered_vehicles).to eq([]) figure out what the pathway means by adding this
      expect(@facility_2.collected_fees).to eq(0)
    end
  end
end
