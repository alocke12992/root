
require_relative 'driver'

class App 
  attr_accessor :input 
  def initialize(input)
    @input = input 
    @results = []
    @output = 'output.txt' 
  end 

  #Opens file and reads the data
  def read_input 
  end 

  #Sorts data according to challenge params (sort miles desc)
  def sort_data 
  end 

  # writes the results to an output file
  def output
  end 

end 
