require 'yaml'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def is_available?(title, author)
    book_id = books.detect { |obj| obj[:item][:title] == title and obj[:item][:author] == author }
      if book_id == nil
        false
      else
        book_id[:available]
      end
  end
end
