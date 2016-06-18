require 'yaml'
require 'date'

class Library

  attr_accessor :collection, :available_books, :checked_out_books, :title

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
    @available_books = check_for_available_books
    @checked_out_books = unavailable?
    @title = title
  end

  def check_for_available_books
    @collection.select { |item| item[:available] == true }
  end

  def unavailable?
    @collection.select { |item| item[:available] == false }
  end

  def search_title(title)
    title_result = @collection.select { |obj| obj[:item][:title].include? title.to_s  }
  end
end
