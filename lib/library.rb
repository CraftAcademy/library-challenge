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
    file.each do |book|
      title = book[:item][:title]
      author = book[:item][:author]
      available = book[:available]
      return_date = book[:return_date]
      puts "#{title} #{author} #{ available ? "available" : return_date}"
    end
  end
  #
  # def list_books(file)
  #   title = file[0][:item][:title]
  #   author = file[0][:item][:author]
  #   available = file[0][:available]
  #   return_date = file[0][:return_date]
  #   "#{title} #{author} #{ available ? "available" : return_date}"
  # end
end

lib = Library.new
booklist = lib.book_list
lib.list_books(booklist)
