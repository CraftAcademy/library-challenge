require 'yaml'
require 'pry'
require 'date'

class Database

  attr_accessor :books

  def initialize 
    @books = YAML.load_file('./lib/data.yml')
  end

  def items_by_title
    items = [ books[0][:item][:title], 
              books[1][:item][:title], 
              books[2][:item][:title], 
              books[3][:item][:title], 
              books[4][:item][:title] 
              ]
  end

  def items_by_author
    items = [ books[0][:item][:author], 
              books[1][:item][:author], 
              books[2][:item][:author],
              books[3][:item][:author],
              books[4][:item][:author]
              ]
  end

  def book_available
    items = [ books[0][:item][:available], 
              books[1][:item][:available], 
              books[2][:item][:available],
              books[3][:item][:available],
              books[4][:item][:available] 
            ]
  end
  def return_date
    Date.today.next_day(30).strftime('%d/%m')

  end

  
    

    



  









end
