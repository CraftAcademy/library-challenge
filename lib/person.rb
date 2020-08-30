require './lib/library'
require 'pry'

class Person

  attr_accessor :name, 

  def initilialize(attrs = {})
    @name = set_person(attrs[:name])

  end

  def set_person(name)
   name.nil? ? missing_name : @name = name
  end

  def missing_name
    raise 'A name is required'
  end

  def books_in_possession(name)
    collection.select { |obj| obj[:item][:withdraw_by].include? "#{name}"  }
      end
    
    
  
end