require 'date'
require 'yaml'
require 'pry'
require './lib/client.rb'

class Library

  attr_accessor :collection

  STANDARD_BORROW_TIME = 1 #month

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
  end

  def display_library
    @collection
  end

  def display_available_titles
    @collection.select { |obj| obj[:available] == true }
  end

  def checkout(title, client)
    unless overdue_check(client)
      book = @collection.detect { |obj| obj[:item][:title].include? title }
      index = @collection.index(book)
      @collection[index][:available] = false
      @collection[index][:return_date] = Date.today.next_month(STANDARD_BORROW_TIME).strftime('%m/%y')
      client.bookshelf.push(book)
      update_database
      return book
    end
  end

  def overdue_check(client)
    client_book = client.bookshelf.detect { |obj| obj[:return_date] < Date.today.strftime('%m/%y') }
    if client_book != nil
      'You have overdue books'
    else
      return
    end
  end

  def checkin(title, client)
    book = @collection.detect { |obj| obj[:item][:title].include? title }
    index = @collection.index(book)
    @collection[index][:available] = true
    @collection[index][:return_date] = nil
    update_database
    client_book = client.bookshelf.detect { |obj| obj[:item][:title].include? title }
    client_index = client.bookshelf.index(book)
    client.bookshelf.delete_at(index)
  end

  def update_database
    File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
  end

  def search(data)
    title =  @collection.select { |obj| obj[:item][:title].include? data }
    author =  @collection.select { |obj| obj[:item][:author].include? data }
    if !title[0].nil? && !author[0].nil?
      return [title, author]
    elsif title[0].nil?
      return author
    elsif author[0].nil?
      return title
    else
      return 'No matches found'
    end
  end
end

=begin
As an individual
In order to get my hands on a good book
I would like to see a list of books currently available in the library
with information about the title and author

As a library
In order to have good books to offer to the public
I would like to be able to have a collection of books

As a library
In order to have good books to offer to the public
I would like to be able to allow individuals to check out a book

As a library
In order to make the books available to many individuals
I would like to set a return date on every check out
and I would like that date to be 1 month from checkout date

As an individual
In order to avoid awkward moments at the library
I would like to know when my book is supposed to be returned
=end
