require 'yaml'
require 'date'
require './lib/individual.rb'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def search(book_title)
    @books.select{ |obj| obj[:item][:title].include? book_title }
  end

  def what_is_available?
    @books.select{ |obj| obj[:available] == true }.map{|obj| obj[:item]}
  end

  def borrow(book_title, individual)
    if search(book_title).map{|obj| obj[:available]} != [true]
      raise 'Book is not available right now'
    else
      search(book_title).map do |obj|
        obj[:available] = false
        obj[:current_possessor] = (individual.name)
        obj[:return_date] = Date.today.next_month(1).strftime('%d/%m/%y')
      end
      File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
    end
  end

  def return(book_title)
    search(book_title).map do |obj|
      obj[:available] = true
      obj[:current_possessor] = 'nil'
      obj[:return_date] = 'nil'
    end
    File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
  end
end
