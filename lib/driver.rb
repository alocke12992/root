require_relative 'trip'

class Driver 
  attr_accessor :id, :name, :total_miles_driven, :mph

  def initialize(name, id)
    @id = id 
    @name = name
    @total_miles_driven = 0 
    @mph = 0
    @new_trip_miles = 0 
  end 

  def id 
    @id = @id + 1 
  end 
  # Calculates the driver's total miles, when a new trip is added
  def sum_trip_data(trip)
    @new_trip_miles  = (@new_trip_miles + trip.miles_driven).round
  end 

  # Calculates the new average mph once a new trip is added
  def driver_avg_speed(trip)
    sum_trip_data(trip)
    id 
		if @mph == 0
			@mph = trip.avg_mph
		else			
			@mph = ((@total_miles_driven + trip.miles_driven.to_f)/((@total_miles_driven/@mph)+(trip.drive_time/60.0)))
		end
		#Setting total miles to new total miles for upcoming next trip
		@total_miles_driven = @new_total_miles
  end 

end 
