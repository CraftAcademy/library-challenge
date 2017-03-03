require 'yaml'

class Patron

  attr_accessor :books

  def initialize
    @patron = YAML.load_file('./lib/patrondb.yml')
  end

  def available_books
    @patron.select { |obj| obj[:available] == true  }.each {|val| puts val }
  end


end
