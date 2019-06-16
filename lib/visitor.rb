require './lib/library.rb'
require './lib/book.rb'
require 'yaml'

class Visitor
    attr_accessor  :name, :checkedout_books

    def initialize(attrs = {})
        set_name(attrs[:name])
        @checkedout_books = {}
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

    def find_title
        find_title = YAML.load_file('./lib/data.yml')
        find_title[:item][:title]
    end

    # def find_title(suggested_title)
    #     # printf "%s by these author(s) : ", suggested_title
    #     author_list = Array.new
    #     @library_books.each{|k,v|
    #         if k[:item][:title] == suggested_title
    #            author_list << k[:item][:author]
    #         end
    #     }
    # end

    # def find_author(suggested_author)
    #     # printf "%s has these titles: ", suggested_author
    #     title_list = Array.new
    #     @library_books.each{|k,v|
    #         if k[:item][:author] == suggested_author
    #             title_list << k[:item][:title]
    #         end
    #     }
    # end

    #Maybe need to create a function for the Visitor to find the book, but through the already established methods in the library.rb file
    # def find_book_by_title(args)
    #     args[:library] == nil ? missing_library : library = args[:library]
    #     library_books = args[:library_books]
    #     file = args[:file]
    #     # pin = args[:pin]
    #     response = library.find_title(suggested_title)
    # end

    # def missing_library
    #     raise "A Library is required"
    # end

    def check_out_book(title) # not sure how we can write the method to checkout a specific book
        check_out = YAML::load_file('./lib/data.yml')
        check_out[:available] = false
        File.open('/tmp/test.yml', 'w') {|f| f.write check_out.to_yaml }
        puts "confirming checkout"
        #how can we make the checked out book go to a list so that visitor can see the the books they have in their possession?
    end

    def check_in_book(title) # not sure how we can write the method to checkin a specific book
        check_in = YAML::load_file('./lib/data.yml')
        check_in[:available] = true
        File.open('/tmp/test.yml', 'w') {|f| f.write check_in.to_yaml }
        #how can we make the checked in book go out of the person's list?
        puts "confirming checkin"

    end

    def see_book_status
        get_status = YAML.load(File.read("./lib/data.yml"))
        get_status[:available] #how can we specify which of the books we want to see?
    end
end