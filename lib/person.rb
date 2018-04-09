require './lib/library.rb'

class Person

  attr_accessor :name, :current_books


  def initialize(attrs = {})
    if attrs[:name] == nil
      raise 'please enter name'
    end

    @name = attrs[:name]
    @current_books = [ ]
  end

  def perform_check_out(attrs = {})
    if attrs[:library] == nil
      raise 'Need a library'
    end
    result = attrs[:library].perform_check_out(attrs[:book_id])
    @current_books.push(result)
    result
  end

  def perform_return(attrs = {})
    if attrs[:book_id] == nil
      raise 'Need a book_id'
    end
    attrs[:library].perform_return(attrs[:book_id])
    @current_books.delete_if { |b| b[:book_id] == attrs[:book_id] }
  end

end
