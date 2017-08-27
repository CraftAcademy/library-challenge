require 'yaml'
$collection = YAML.load_file('./lib/data.yml')

class Library

  def show_books
    @available = $collection.select { |book| book[:available]  }
    @available.each do |book|
      puts "#{book[:item][:title]} written by #{book[:item][:author]} is available"
    end

    @unavailable = $collection.select { |book| book[:available] == false }
    @unavailable.each do |book|
      puts "#{book[:item][:title]} written by #{book[:item][:author]} is currently unavailable"
    end
  end

  def search(keyword)
    books = $collection.select { |book| book[:item][:title].include? keyword }
    books.each do |book|
      puts book
    end
  end
end
