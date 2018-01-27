require 'yaml'
require 'date'
require 'person'

class Library

  attr_accessor :collection

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
  end

  def booklist
    list = @collection
    list.each do |x|
      x.each do |y|
        puts y
    end
  end
  end

  def availability(title, author)
    #The find method returns the first element for which block is not false:
    book_info = @collection.find { |obj| obj[:item][:title] == title and obj[:item][:author] == author }
      if book_info == nil
        false
      else
        book_info[:available]
      end
  end

  def return_date
    Date.today.next_month(1).strftime("%m/%Y")
  end
end
