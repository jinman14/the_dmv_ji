class VehicleFactory
    attr_reader :cars

    def initialize
        @cars = []
    end

    def create_vehicles(vehicle_details)

        vehicle_details.each do |vehicle|
            new_vehicle = Vehicle.new({
                :engine => :ev,
                :make => vehicle[:make],
                :model => vehicle[:model],
                :vin => vehicle[:vin_1_10],
                :year => vehicle[:model_year]
            })

            @cars << new_vehicle
        end
    end
end