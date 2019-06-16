require './lib/library.rb'
require 'yaml'

class Visitor
    attr_accessor  :name, :checkedout_books

    def initialize(attrs = {})
        set_name(attrs[:name])
        @checkedout_books = {}
        @library = Library.new
    end

    def see_book_list
        book_list = YAML.load_file('./lib/data.yml')
        
    end

    def set_name(obj)
        obj == nil ? missing_name : @name = obj.to_s
    end

    def missing_name
        raise "A name is required"
    end

    def find_by_title(book_title)
        @library.find_by_title(book_title)
    end

    def find_by_author(author_name)
        @library.find_by_author(author_name)
    end

   
    def check_out_book(title) # not sure how we can write the method to checkout a specific book
     @library.check_out(title)
        # check_out = YAML::load_file('./lib/data.yml')
        # check_out[:available] = false
        # File.open('/tmp/test.yml', 'w') {|f| f.write check_out.to_yaml }
        puts "confirming checkout"
        #how can we make the checked out book go to a list so that visitor can see the the books they have in their possession?
    end

    def check_in_book(title) # not sure how we can write the method to checkin a specific book
      @library.check_in(title)
       
        # check_in = YAML::load_file('./lib/data.yml')
        # check_in[:available] = true
        # File.open('/tmp/test.yml', 'w') {|f| f.write check_in.to_yaml }
        #how can we make the checked in book go out of the person's list?
        puts "confirming checkin"

    end

    def see_book_status
        get_status = YAML.load(File.read("./lib/data.yml"))
        get_status[:available] #how can we specify which of the books we want to see?
    end
end