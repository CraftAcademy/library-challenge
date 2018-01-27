require 'date'
require 'yaml'
require 'pry'
require './lib/client.rb'

class Library

  attr_accessor :collection, :client

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
    @client = Client.new
  end

  def display_library
    @collection
  end

  def available_titles
    @collection.select { |obj| obj[:item][:available] == true  }
  end

  def checkout(title)
    book = @collection.detect { |obj| obj[:item][:title].include? title  }
    index = @collection.index(book)
    @collection[index][:available] = false
    @client.add_book(book)

    # add return date
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
