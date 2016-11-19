require 'yaml'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def search(book)
    @books.select{ |obj| obj[:item][:title].include? book }
  end

  def what_is_available?
    @books.select{ |obj| obj[:available] == true }.map{|obj| obj[:item]}
  end

  def borrow(book)
    # if search(book).map{|obj| obj[:available] = false}
    #   raise 'book is not availble right now'
    # else
    search(book).map{|obj| obj[:available] = false}
    File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
  end

  # def return(book)
  #   gör om filen till book :available false
end
