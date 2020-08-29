require 'pry'
require 'yaml'

class Books
  collection = YAML.load_file('./lib/books_list.yml')

  attr_accessor :collection

  def initialize
    
    
  

  end
  def check_list
  
  end
  
end