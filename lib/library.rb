require 'date'
require 'pry'


class Library
  attr_accessor :collection

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
  end

  def search_by_author(author_name)
    search_result = @collection.select{|obj| obj[:item][:author].include? author_name}
  end
end

