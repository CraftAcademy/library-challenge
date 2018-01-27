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
<<<<<<< HEAD

      #Checks parameter "available"
      if items[:available] != true
        status = 'Utlånad'
      else
        status = 'Tillgänglig'
      end

      puts "Book: #{book}, Author: #{author}, Available: #{status}"
=======
      #Checks parameter "available"
      items[:available] ? status = 'Utlånad' : status = 'Tillgänglig'
      #Returns a string with books
      puts "Book: #{book}, Author: #{author}, Available: #{status}"
      #puts "Book: #{book}, Author: #{author}, Available: #{status}"
>>>>>>> list_books

    end
  end

<<<<<<< HEAD
=======
  def search_books(search_word, available)
    search_result = @books.select { |items| items[:item][:title].include? search_word  }
    search_result.each do |book|
      if available == book[:available]
        puts "Book: #{book}"
      elsif available == 'All'
        puts "Book: #{book}"
      end
    end
  end

>>>>>>> list_books
end

#books = YAML::load_file(File.join(__dir__, 'data.yml'))
#puts @books[0][title]
