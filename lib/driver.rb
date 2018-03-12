class Driver 
  attr_accessor :name, :trips, :total_miles_driven, :mph

  def initialize(name)
    @name = name
    @total_miles_driven = 0 
    @mph = 0
    @new_trip_miles = 0 
  end 

  # Calculates the driver's total miles, when a new trip is added
  def sum_trip_data(trip)
    @new_trip_miles  = (@new_trip_miles + trip.miles).round
  end 

  # Calculates the new average mph once a new trip is added
  def driver_avg_speed(trip)
    if @mph == 0
      @mph = trip.mph
    else 
      @mph = ((@total_miles_driven + trip.miles) / ((@total_miles_driven/@mph) + (trip.drive_time/60.0)))
    end 

    @total_miles_driven = @new_trip_miles 
  end 

end 
