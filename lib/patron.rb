

class Patron

  attr_accessor :nightstand

  def initialize
    @nightstand = YAML.load_file('./lib/patron_books.yml')
  end

end
