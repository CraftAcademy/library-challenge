require 'date'
require 'pry'


class Library
  attr_accessor :collection

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
    # binding.pry
  end

  def search_by_author(author_name)
    search_result = @collection.select{|obj| obj[:item][:author].include? author_name}
  end

  # def checkout(book)
  #   we need to find a way to call the exact book that we want to change this --> [:item][:available] = false
  # end


end

