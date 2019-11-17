require 'yaml'
require 'date'
class Library_main

    require 'date'
    attr_accessor :collection

    def initialize
      @collection = YAML.load_file('./lib/data.yml')
    end

    def check_avl (title,author)
      book = @collection.detect { |obj| obj[:item][:title] == title && obj[:item][:author] == author } 
      return book[:available]
    end

    def check_out (title,author)
      avl = check_avl(title,author)
      if avl == true 
        index = @collection.find_index { |obj| obj[:item][:title] == title && obj[:item][:author] == author } 
        @collection[index][:available] = false
        @collection[index][:return_date] = Date.today.next_day(30).strftime('%d/%m/%y')
        #@collection[index][:return_date] = Date.today + 30
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
      end
    end
     
    def check_in (title,author)
      index = @collection.find_index { |obj| obj[:item][:title] == title && obj[:item][:author] == author } 
      @collection[index][:available] = true
      @collection[index][:return_date] = nil
      File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
    end
     
    def return_date (title,author)
        index = @collection.find_index { |obj| obj[:item][:title] == title && obj[:item][:author] == author } 
        if @collection[index][:available] == false
            return @collection[:index][:return_date]
        end
    end

end