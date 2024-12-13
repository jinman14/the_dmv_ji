class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
  end

  def collected_fees
    @collected_fees = 0

    @registered_vehicles.each do |vehicle|
      if vehicle.antique?
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
      else
        @collected_fees += 100
      end
    end

    @collected_fees
  end

  
end
