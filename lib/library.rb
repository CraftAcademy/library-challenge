require 'yaml'

class Library
  attr_accessor :list_of_books, :updated_list

  def initialize
    @list_of_books = YAML.load_file('./lib/base_data.yml')
    @updated_list = YAML.load_file('./lib/test_data.yml')
  end

  def search_for_title(title)
    list_of_books.detect { |obj| obj[:book][:title].include? title }
  end

  def search_for_author(author)
    list_of_books.detect { |obj| obj[:book][:author] == author }
  end

  def checkout_book(title)
    # if search_for_title(title)[:available] == false
    #   return 'unavailable'
    
    # else
      search_for_title(title)[:available] = false

      File.open('./lib/test_data.yml', 'w') { |f| f.write list_of_books.to_yaml }
      updated_list.detect { |obj| obj[:book][:title].include? title }
    #end
  end
end
