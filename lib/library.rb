require 'yaml'
require 'date'
require 'person.rb'

class Library

  attr_accessor :books

  def initialize
    @books = YAML::load_file(File.join(__dir__, 'data.yml'))
  end

  #LIST BOOKS
  def list_available_books
    @books.select {|book| book[:available] == true }
  end

  def list_checked_out_books
    @books.select {|book| book[:available] == false }
  end

  #SEARCH BOOKS
  def search_books_by_title(query)
    @books.select { |obj| obj[:item][:title].include? query  }
  end

  def search_books_by_author(query)
    @books.select { |obj| obj[:item][:author].include? query  }
  end

  #SET DUE DATE TEST
  def set_due_date(book)
    selection = @books.detect { |obj| obj[:item][:title] == book }
    selection[:available] = false
    selection[:return_date] = "#{Date.today >> 1}"
    File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
    @books
  end

  #CHECKOUT BOOKS
  def checkout(book, person)
      my_choice = @books.select { |obj| obj[:item][:title].include? book }
      #binding.pry
      my_choice[0][:available] = false
      my_choice[0][:return_date] = Date.today >> 1
      person.bookshelf << my_choice

      # Goes through the books and only updates the one we checked out
      @books.each do |items|
        if items[:item][:title] == my_choice[0][:item][:title]
          items[:available] = false
          items[:return_date] = "#{Date.today >> 1}"
        end
      end

      # Opens and writes to our Yaml-file
      File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
      my_choice[0][:item][:title]
    end

end
