require 'date'
require 'pry'


class Library
  attr_accessor :collection , :book_available

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
    @book_status = :true
    # binding.pry
  end

  def search_by_author(author_name)
    search_result = @collection.select{|obj| obj[:item][:author].include? author_name}
  end

  def checkout
    book_to_borrow = @collection.detect{|obj| obj[:item][:title] == chosen_book_name}
    @book_checkout = :false
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
  end 

  # def checkout(book)
  #   we need to find a way to call the exact book that we want to change this --> [:item][:available] = false
  # end


end

def check_availability
check_for_availability
if available
  book_checkout
  book_available: false
end