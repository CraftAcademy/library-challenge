require 'yaml'
require './lib/library'
$collection = YAML.load_file('./lib/data.yml')

class Person

  puts "What would you like to do?"
  puts "-- type 'display' to show all books"
  puts "-- type 'search' to search the book by title"

  choice = gets.chomp.downcase
  case choice
  when 'display'
    $collection.each do |book|
        puts "#{book[:item][:title]} written by #{book[:item][:author]} is available"
    end
  when 'search'
    puts "Text to search through: "
    keyword = gets.chomp
    if keyword.search == nil
      puts "Book not found"
    else
      puts book
      puts "Would you like to checkout the book: press c"
      input = gets.chomp

private

def search(keyword)
  books = $collection.select { |book| book[:item][:title].include? keyword }
  books.each do |book|
    puts book
  end
end
