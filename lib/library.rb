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
  def check_out
    case
    when [:available] == false then {message: 'Not available'}
    else
      check_out_active(item)
    end
  end

  end

  private

  def set_today
    Date.today.strftime('%F')
  end

   def return_date
     Date.today.next_month.strftime('%F')
   end

   def collection_status(item, args={})
     @collection.detect do |i|
       if i[:item][:title] == item[:item][:title]
         i[:available] = args[:available]
         i[:return_date] = args[:return_date]
       end
     end
   end

   def check_out_active(item)
     collection_status(item, available: false, return_date: return_date)
     update_yaml_file
   end

   def update_yaml_file
     File.open('./lib/data.yml', 'w') { |f| f.write self.items.to_yaml }
   end
end
