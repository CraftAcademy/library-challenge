require '/lib/data.yml'
require 'yaml'


class Library
  attr_accessor :title

  list_of_books = YAML.load_file('./lib/data.yml')

  def search_for_title(title)
    list_of_books.detect { |obj| obj[:item][:title] == (title) }
  end
end

#small change
