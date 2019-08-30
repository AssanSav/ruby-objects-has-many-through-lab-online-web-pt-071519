require 'pry'

class Patient 
   attr_accessor :name
   @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self 
  end
  
  def self.all 
    @@all 
  end
  
  def appointments 
    Appointment.all.select {|ap| ap.patient == self}
  end
  
  def new_appointment(doctor, date)
    new_appointment = Appointment.new(date, self, doctor)
  end
  
  def doctors 
    appointments.collect {|ap| ap.doctor}
  end
end