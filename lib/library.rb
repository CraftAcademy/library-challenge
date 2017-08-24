require 'yaml'
require 'pry'

class Library

  collection = YAML.load_file('./lib/book_data.yml')
  exit = false

  while exit == false

    puts "Welcome to the library of your dreams. What would you like to do?
    1. to list all books in library records
    2. to list which books are available/unavailable
    3. to searching for an author
    4. to exit menu"

    n = gets.chomp.to_i

    case n
    when 1
      collection.each do |book|
          puts "#{book[:item][:title]} by #{book[:item][:author]} (#{book[:item][:genre]})"
        end
    when 2
      collection.each do |title|
        if title[:available] == true
          puts "available: #{title[:item][:title]} by #{title[:item][:author]} (#{title[:item][:genre]})"
        else
          puts "not available: #{title[:item][:title]} by #{title[:item][:author]} (#{title[:item][:genre]})"
        end
      end
    when 3
      puts "Which author do you want to search for?"
      author = gets.chomp
      result = collection.select { |obj| obj[:item][:author].include? author }
      result.each do |book|
        puts "#{book[:item][:title]} by #{book[:item][:author]} (#{book[:item][:genre]})"
      end
    when 4
      exit = true
    end
    if exit == false
      puts "press any key to continue"
      x = gets.chomp
      system "clear"
    end
  end
end
