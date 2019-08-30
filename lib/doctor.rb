require 'pry'

class Doctor 
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
      binding.pry
    Appointment.all.select {|ap| ap.doctor == self}
  end
  
  def new_appointment(date, patient)
    new_appointment = Appointment.new(date, patient, self)
  end
  
  def patients 
    appointments.collect do |ap| 
      ap.patient
    end
  end
end