require 'yaml'

class Library

  attr_reader :book_list

  def initialize
    @book_list = load_yaml('./lib/collection.yml')
  end

  def return_date(date)
    date.next_month
  end

  def load_yaml(file)
    YAML.load_file(file)
  end
end
