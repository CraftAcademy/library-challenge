require 'yaml'
require 'pry'
require 'date'
require './lib/user.rb'

class Library
  attr_accessor :collection

  def initialize
    @collection = YAML.load_file('./lib/book_data.yml')
  end

  def menu
    @exit = false

    while @exit == false

      puts 'Welcome to the Library of Coming Books. Choose an option.
      1. to list which books are available/unavailable
      2. to searching for an author
      3. to borrow a book
      4. to exit'

      n = gets.chomp.to_i

      case n
      when 1 then list_books
      when 2 then search_author
      when 3 then borrow
      when 4 then exit_program
      else error_message
      end

      if @exit == false
        puts 'press ENTER to return to menu'
        x = gets.chomp
        system "clear"
      end
    end
  end

  #private

  def list_books
    @collection.each do |title|
      if title[:available] == true
        puts "available: #{title[:item][:title]} by #{title[:item][:author]} (#{title[:item][:genre]})"
      else
        puts "not available: #{title[:item][:title]} by #{title[:item][:author]} (#{title[:item][:genre]}). Return date: #{title[:return_date]}"
      end
    end
  end

  def search_author
    puts 'Which author do you want to search for? Please enter first OR last name.'
    author = gets.chomp.capitalize
    result = @collection.select { |obj| obj[:item][:author].include? author }

    result.each do |book|
      puts "#{book[:item][:title]} by #{book[:item][:author]} (#{book[:item][:genre]})"
    end
  end

  def borrow
    puts 'Which book do you want to borrow? Enter the corresponding number.'
    @collection.each_with_index do |title, index|
      index_plus_one = index + 1
      puts "#{index_plus_one}. #{title[:item][:title]} by #{title[:item][:author]} (#{title[:item][:genre]})"
    end

    index = gets.chomp.to_i - 1
    return_date(index)
    change_status(index)
    puts "You borrowed: #{@collection[index][:item][:title]} by #{@collection[index][:item][:author]}. Return by: #{@collection[index][:return_date]}!"

    user.books << "#{@collection[index][:item][:title]}, #{@collection[index][:return_date]}"

  end

  def exit_program
    @exit = true
    puts 'Come back soon, there\'s lots to read here!'
  end

  def change_status(index)
    @collection[index][:available] ^= true
    File.open('./lib/book_data.yml', 'w') {|f| f.write @collection.to_yaml}
  end

  def return_date(index)
    @collection[index][:return_date] = Date.today.next_month.strftime("%d/%m/%y")
    File.open('./lib/book_data.yml', 'w') {|f| f.write @collection.to_yaml}
  end

  def error_message
    puts 'Choose correct menu number'
  end
end
