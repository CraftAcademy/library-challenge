require 'yaml'
require 'date'

class Person

  def search_my_books
    books.select { |obj| obj[:item][:renter]}
    return [:return_date]
  end

end

private
  def books
    YAML.load_file('./lib/books.yml')
  end
