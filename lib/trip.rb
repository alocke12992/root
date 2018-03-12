require 'time'

class Trip 
  attr_accessor :start, :stop, :miles 

  def initialize(start, stop, miles)
    midnight = Time.local(2018,3,10,0,0,0)
    @start = (Time.parse(x) - midnight).to_f  
    @stop = (Time.parse(y) - midnight).to_f
    @miles = miles.to_f 
  end 
end 