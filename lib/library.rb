require 'yaml'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def search(book)
    @books.select{ |obj| obj[:item][:title].include? book }
  end
end
#   def available
#     puts @books.select{ |obj| obj[:available].include?  }
#   end
# end

  # if book == nil
  #   @books = book
  #   else
  #  end
