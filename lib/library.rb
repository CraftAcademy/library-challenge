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

  def list_books(file)
    title = file[0][:item][:title]
    author = file[0][:item][:author]
    available = file[0][:available]
    return_date = file[0][:return_date]
    "#{title} #{author} #{ available ? "available" : return_date}"
  end
end
