
require_relative 'driver'
require_relative 'trip'

class App 
  attr_accessor :input 
  def initialize(input)
    @input = input 
    @results = []
    @drivers = Hash.new
    @output = 'output.txt' 
  end 

  #Opens file and reads the data
  def read_input 
    File.open(@input).each do |l|
      line = l.downcase.split(" ")
      case line[0]
        when "driver"
          @drivers[line[1]] = Driver.new(line[1])
          @results << @drivers 
        when "trip"
          if @drivers[line[1]]
            driver = @drivers[line[1]]
            trip = Trip.new(line[2], line[3], line[4])
            #exclude trips with with avg speed less than 4 and greater than 100
            if ( trip.mph > 4) && (trip.mph < 101)
              driver.driver_avg_speed(trip)
            end 
          end  
        else 
          "error with input data"
      end
    end
    output  
  end 


  # writes the results to an output file
  def output
    sort_data
    File.open(@output, 'w+') do |file|
      @drivers.each do |key, value| 
        file.write "#{value.name}: #{value.total_miles_driven} miles @ #{value.mph}\n"
      end 
    end  
  end 

  #Sorts data according to challenge params (sort miles desc)
  def sort_data 
    @drivers = @drivers.to_a 
    @drivers.sort! {|a, b| b[1].total_miles_driven <=> a[1].total_miles_driven} 
    @drivers = @drivers.to_h 
  end 

end 
