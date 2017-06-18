require 'yaml'

class Library
  attr_accessor :title, :author, :available, :return_date, :item

  def initialize
    @title = 'title'
    @author = "author"
    @available = 'available'
    @return_date = 'return_date'
    @item = 'item'
  end

collection = YAML.load_file('./lib/data.yml')
puts collection

loop do
  puts "Do you want to borrow a book? (Y/N)"
  answer = gets.chomp
  if answer != "Y"
    break
  end
  puts "Wich book do you want to borrow?"
  answer1 = gets.chomp

end

end
