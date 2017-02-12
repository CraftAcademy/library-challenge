require 'yaml'

class Library
  attr_accessor :bookrack

  def initialize
    @bookrack = YAML.load_file('./lib/booksdb.yml')
  end
end
