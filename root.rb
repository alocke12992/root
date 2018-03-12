# This was the first iteration of the program 

require 'pry'
require 'time'


@drivers = [] 
@trips = [] 
@trip_driver = [] 

    

  def app 
    input = []
    ARGF.each_line do |line| 
      @white_space = line.chomp.empty?
      input << line unless line.chomp.empty?
    end 
    slice(input) 
    drivers_no_trips 
    sum_trips(@trips)
  end 

  def slice(input)
    input.each_with_index do |l, i| 
      line = l.downcase.split(" ")
      case line[0]
        when  "driver"
        @drivers << line[1]
        when "trip"
          trip(line)
        else 
          error_with(i)
      end
    end
  end 


  def trip(line)
    @trip_driver << line[1]
    name = line[1]
    time(line[2], line[3])
    miles = line[4].to_f 
    mph(@drive_time, miles)
    trip = {driver: name.capitalize, miles: miles.round, speed: @mph }
    @trips << trip
  end 

  def time(x, y)
    @drive_time = (Time.parse(y) - Time.parse(x)) / 60 

  end 

  def mph(time, miles)
    @mph = (miles / (time/60)).round
  end 

  def sum_trips(trips)
    result = trips.group_by { |t| 
      t[:driver] }.map do |name, ptrips| {
        driver: name, 
        miles: ptrips.sum {|t|t[:miles]}, 
        speed: (ptrips.sum {|t| t[:speed]}) / ptrips.length
      }  
      end
    sort(result)
  end 

  def sort(results)
    sorted = results.sort_by {|t|t[:miles]}.reverse
    sorted.each do |t|
      if t[:miles] == 0 
        puts "#{t[:driver]}: #{t[:miles]} miles"
      else 
        puts "#{t[:driver]}: #{t[:miles]} miles @ #{t[:speed]} mph"
      end 
    end 
  end 

  def error_with(line)
    puts "Error - incorrect command in line #{line + 1}"
    puts 'Please ensue the line begins with "Driver" or "Trip"'
  end 

  def drivers_no_trips
    result = @drivers - @trip_driver
    trip = {driver: result[0], miles: 0, drive_time_minutes: 0, speed: 0}
    @trips << trip
  end 
  
  def trips_no_drivers 
    tdriver = @trips.map {|d| d[:driver]}.uniq
    result = tdriver - @drivers
    @trips = @trips - result
    if result.empty? 
      puts "all drivers are registered"
    else 
      if result.length < 2 
        puts "Error, #{result} is not a registered driver"
      else 
        puts "Error, the following drivers are not registered:" 
        result.each {|d| puts d}
      end 
    end 
  end 


app


