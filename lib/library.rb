require 'yaml'
require 'date'
require 'person'

class Library

  attr_accessor :collection, :title, :author, :available

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



def check_out(search_word)
      check_out_book = @collection.select { |book| book [:item][:title].include? search_word }
     if check_out_book.select {|book| book["available"] == true }
       check_out_book.select {|book| book["available"] = false }
       File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
       "Book checked out, Please return book by: #{return_date}"
    else
       "Book is not available "
     end
     end
   end
