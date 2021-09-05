require "yaml"
require "date"

class Library
  attr_accessor :collection, :return_date

  def initialize(_attrs = {})
    @collection = YAML.load_file("./lib/data.yml")
  end

  def search(title)
    YAML.load_file("./lib/data.yml").select { |book| book[:item][:title].include? title }
  end

  def available_books
    @collection.select { |book| book[:available] == true }
  end
end
