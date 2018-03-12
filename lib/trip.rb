require 'time'

class Trip 
  attr_accessor :start, :stop, :miles, :drive_time 

  def initialize(start, stop, miles)

    @start = start
    @stop = stop 
    @miles = miles.to_f 
    @drive_time = time(@start,@stop)
  end 

  #finds average speed of trip 
  def mph
    if @drive_time == 0 
      return 0 
    else 
      return ((@miles / @drive_time)) / 60)
  end 

  #calculate drive time for trip in minutes. 
  def time(start, stop)
   (Time.parse(stop) - Time.parse(start)) / 60 
  end 

end 