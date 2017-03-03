require 'yaml'

class Library
  attr_accessor :bookrack

  def initialize
    @bookrack = YAML.load_file('./lib/booksdb.yml')
  end
end

def available_books
  @bookrack.select{|obj| obj[:available] == true}.each {|val| puts val}
end

def test
  @bookrack = @bookrack[2][:item]
end

def list_of_books
  @bookrack.each {|val| puts val}
end

def patron_checkout(book_id)
  book_id -=1
  date = Date.today + 30
  @bookrack[book_id][:available] = false
  @bookrack[book_id][:return_date] = date.to_s
  File.open('./lib/booksdb.yml','w') {|f| f.write @bookrack.to_yaml}
  @patron[book_id][:available] = false
  @patron[book_id][:return_date] = date.to_s
  File.open('.lib/patron.yml','w'){|f| f.write @patron.to_yaml}
end
