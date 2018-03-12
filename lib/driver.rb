class Driver 
  attr_accessor :name, :trips, :miles, :mph

  def initialize(name)
    @name = name
    @total_miles_driven = 0 
    @mph = 0
    @new_trip_miles = 0 
  end 

  # Calculates the driver's total miles, when a new trip is added
  def sum_trip_data(trip)
    @total_miles_driven = (@total_miles_driven + trip.miles).round
  end 

  # Calculates the new average mph once a new trip is added
  def update_driver_totals(trip)
      @speed = ((@total_miles_driven + trip.miles) / ((@total_miles_driven/@mph) + (trip.drive_time/60.0))
  end 

end 
