require 'time'

class Trip 
  attr_accessor :start, :stop, :miles_driven, :drive_time 

  def initialize(start, stop, miles_driven)
    @start = start
    @stop = stop 
    @miles_driven = miles_driven.to_i 
    @drive_time = time(@start,@stop)
  end 

  #finds average speed of trip 
  def avg_mph
    (@miles_driven / @drive_time)
  end 

  #calculate drive time for trip in minutes. 
  def time(start, stop)
   (Time.parse(stop) - Time.parse(start)) / 60 
  end 

end 