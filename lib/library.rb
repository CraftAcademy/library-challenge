require 'yaml'

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
    @collection.each do |title|
      puts "#{title[:item][:title]}"
    end
  end

   private

   def set_today
     Date.today.strftime('%F')
   end

   def return_date
     Date.today.next_month.strftime('%F%')
   end

end
