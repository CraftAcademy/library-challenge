require 'yaml'
require 'pry'

class Database

  attr_accessor :books

  def initialize 
    @books = YAML.load_file('./lib/data.yml')
  end

  def items_by_title
    items = [ books[0][:item][:title], 
              books[0][:item][:title], 
              books[0][:item][:title], 
              books[0][:item][:title], 
              books[0][:item][:title] ]
  end

  
    

    



  









end
