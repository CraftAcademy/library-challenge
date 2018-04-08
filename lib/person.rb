require './lib/library.rb'

class Person

  attr_accessor :name


  def initialize(attrs = {})
    if attrs[:name] == nil
      raise 'please enter name'
    end

    @name = attrs[:name]


  end

  def perform_check_out(attrs = {})
    if attrs[:library] == nil
      raise 'Need a library'
    end
    result = attrs[:library].perform_check_out(attrs[:book_id])
  end
end
