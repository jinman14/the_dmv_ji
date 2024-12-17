require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type

  attr_accessor :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
  end

  def antique?

    Date.today.year - @year > 25

  end

  def electric_vehicle?

    @engine == :ev

  end

  def registration_date

    @registration_date
    
  end
  
  def plate_type

    if @registration_date != nil && antique? == true
      @plate_type = :antique

    elsif @registration_date != nil && electric_vehicle? == true
      @plate_type = :ev

    elsif @registration_date != nil 
      @plate_type = :regular
      
    else
      @plate_type = nil
    end
  end

end
