require "date"
require "yaml"
require "./lib/book.rb"

class Library

    attr_accessor :collection

    def initialize(attr={})
        @collection = set_collection
    end
 
    def set_collection
        (YAML.load_file('./lib/data.yml')).map! {|rawdata|  Book.new(rawdata.merge({library:self}))}
    end


    def list_collection
        @collection
    end

    def find_title(search_word)
        @collection.select {|book| book.title.include? search_word}
    end

    def find_author(search_word)
        @collection.select {|book| book.author.include? search_word}
    end

    def find_category(search_word)
        @collection.select {|book| book.category.include? search_word}
    end

    def find_available
        @collection.select {|book| book.available==true }
    end

    def find_unavailable
        @collection.select {|book| book.available==false }
    end


    def obj_to_hash(bookobj)     
     {item:{title:bookobj.title,author:bookobj.author,category:bookobj.category},available:bookobj.available,loanee:bookobj.loanee,return_date:bookobj.return_date}
    end

    def write_database
        updated_hash = []
       @collection.each do |book|
           updated_hash << obj_to_hash(book)
       end
       File.open('./lib/data.yml', 'w') { |f| f.write updated_hash.to_yaml }
    end



end
