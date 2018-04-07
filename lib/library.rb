require 'yaml'

class Library

  def initialize
    books = YAML.load_file('./lib/data.yml')
  end

  def list_all
    puts books
  end

  def list_available
    puts books.select { |x| x[:available] == true }
  end

end
