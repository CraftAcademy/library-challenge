require 'date'
require 'yaml'

class Library
    attr_accessor :available, :return_date, :title, :author

    STANDARD_VALIDITY_MONTHS = 1

    def collection
        collection = YAML.load_file('./lib/data.yml')
    end

  
    
    #def index
        #index = collection.index(:title)

    #case def with !true statements like atm.rb
    #collection.select{|book| book[:book][:title].include?

    def search_author(author)
        collection.select{|book| book[:book][:title].include? author }
    end

    def search_title(title)
        collection.select{|book| book[:book][:title].include? title }
    end


         
=begin 
    def book_info
        yml = YAML::load(File.open('./lib/data.yml'))

        title = yml['book']['title']
        title.each{||}


   def book_info
        yml = YAML.load_file '.lib/data.yml'
        yml.each_key { |key|
            title = yml[key]['title']
            author = yml[key]['author']
            available = yml[key]['available']
            puts "#{title}, Written by #{author}, available: #{available}"
    }
   end
=end
    


    def checkout
        collection.select {|book| book[:book][:title].include? title}
        collection[0][:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def return
        collection.select {|book| book[:book][:title].include? title}
        collection[0][:available] = true
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

end