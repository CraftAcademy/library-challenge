require 'yaml'
require 'date'

class Library
  attr_accessor :collection

  def initialize
    @collection = YAML.load_file('./lib/book_collection.yml')
  end
  def book_list
     @collection.each do |book|
       if book[:available] == true
         puts "#{book[:item][:title]} author: #{book[:item][:author]}"
       else
         puts "LOANED #{book[:item][:title]} author: #{book[:item][:author]}"
       end
     end
  end

  def search_title
  result = @collection.select { |obj| obj[:item][:title].include? "Androids" }
  result.each do |book|
    puts "#{book[:item][:title]} author: #{book[:item][:author]}"
  end
  end
end
