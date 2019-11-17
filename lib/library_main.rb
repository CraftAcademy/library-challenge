require 'yaml'

class Library_main

    attr_accessor :collection

    def initialize
      @collection = YAML.load_file('./lib/data.yml')
    end

    def check_avl (title,author)
      book = collection.detect { |obj| obj[:item][:title] == title} 
      return book[:item][:availble]
    end

    def check_out (title,author)
    end

    


end