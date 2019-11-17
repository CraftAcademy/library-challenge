require 'yaml'

class Library_main

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
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
      end
    end
     
    def check_in (title,author)
      index = @collection.find_index { |obj| obj[:item][:title] == title && obj[:item][:author] == author } 
      @collection[index][:available] = true
     File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
    end
end