require 'yaml'
require 'pry'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def search(books)
    if @books.select { |obj| obj[:item][:title].include? (books) }.any?
      @books.select { |obj| obj[:item][:title].include? (books) }
    else
      @books.select { |obj| obj[:item][:author].include? (books) }
    end
  end

  def availability
    if @books.select { |obj| obj[:available] == true }.any?
      @books.select { |obj| obj[:available] == true }
    
    end
  end

end
