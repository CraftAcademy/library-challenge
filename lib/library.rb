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

  def checkout(title)
    book_to_borrow = @collection.detect{|obj| obj[:item][:title] == title}
    book_to_borrow[:available] = false
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
  end 


end
