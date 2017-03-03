require 'yaml'

class Patron

  attr_accessor :bookrack

  def initialize
    @patron = YAML.load_file('./lib/patrondb.yml')
  end

  def available_books
    @patron.select { |obj| obj[:available] == true  }.each {|val| puts val }
  end

  def checkedout_book_list
    @patron.select { |obj| obj[:available] == false }.each {|val| puts val}
  end


end
