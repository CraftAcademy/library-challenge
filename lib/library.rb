require 'yaml'

class Library

  attr_reader :book_list

  def initialize
    @book_list = YAML.load_file('./lib/collection.yml')
  end

  def return_date(date)
    date.next_month
  end
end
