require './lib/library'
require 'pry'

class Person

  attr_accessor :name, :collection, :x

  def initilialize(attrs = {})
    @name = set_person(attrs[:name])
    @collection = YAML.load_file('./lib/books_list.yml')
    @title = ''
  end

  def set_person(name)
   name.nil? ? missing_name : @name = name
  end

  def missing_name
    raise 'A name is required'
  end

  def books_in_possession(name)
     @x= collection
     binding.pry

    #x= collection.select { |obj| obj[:item][:title].include? "#{title}"}

  end
      
  
end