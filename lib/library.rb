require 'yaml'

class Library
  attr_accessor :title, :list_of_books

  def initialize
    @list_of_books = YAML.load_file('./lib/base_data.yml')
  end

  def search_for_title(title)
    list_of_books.select { |obj| obj[:item][:title].include? title }
  end

  def search_for_author(author)
    list_of_books.detect { |obj| obj[:item][:author] == author }
  end
end
