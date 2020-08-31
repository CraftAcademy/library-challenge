require './lib/library'
require 'pry'

class Person

  attr_accessor :name, :new_var

  def initilialize(attrs = {})
    @name = set_person(attrs[:name])
    @new_var = 45
    
  end

  def set_person(name)
   name.nil? ? missing_name : @name = name
  end

  def missing_name
    raise 'A name is required'
  end
   
     
end