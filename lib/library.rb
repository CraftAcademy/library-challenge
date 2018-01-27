require 'yaml'

class Library

  attr_accessor :books

  def initialize
    @books = YAML::load_file(File.join(__dir__, 'data.yml'))
  end

  def list_books
    @books.each do |items|
      book = items[:item][:title]
      author = items[:item][:author]
      available = items[:available]
      return_date = items[:return_date]
      #Checks parameter "available"
      items[:available] ? status = 'Utlånad' : status = 'Tillgänglig'
      #Returns a string with books
      puts "Book: #{book}, Author: #{author}, Available: #{status}"
      #puts "Book: #{book}, Author: #{author}, Available: #{status}"

    end
  end

  def list_available_books

  end

end

#books = YAML::load_file(File.join(__dir__, 'data.yml'))
#puts @books[0][title]
