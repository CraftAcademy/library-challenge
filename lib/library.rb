require "date"
require "yaml"
require "./lib/book.rb"

class Library

    attr_accessor :collection, :users

    def initialize(attr={})
        @collection = set_collection
        @users = set_users
    end
 
    def set_collection
        (YAML.load_file('./lib/data.yml')).map! {|rawdata|  Book.new(rawdata.merge({library:self}))}
    end

    def set_users
        (YAML.load_file('./lib/users.yml')).map! {|user|  Person.new(user)}
    end

    def add_user(attrs = {})
        @users << Person.new(attrs)
        update_user_database
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


    def book_to_hash(bookobj)
        name = bookobj.loanee.nil? ? nil : bookobj.loanee.name     
     {item:{title:bookobj.title,author:bookobj.author,category:bookobj.category},available:bookobj.available,loanee: name, return_date:bookobj.return_date}
    end

    def user_to_hash(userobj)
        {name: userobj.name, phone: userobj.phone, role: userobj.role, active: userobj.active, id: userobj.id, born_date: userobj.born_date, no_of_borrowed_books: userobj.receipts.length}
    end

    def write_database
        updated_hash = []
       @collection.each do |book|
           updated_hash << book_to_hash(book)
       end
       File.open('./lib/data.yml', 'w') { |f| f.write updated_hash.to_yaml }
    end

    def update_user_database
        updated_users = []
        @users.each do |user|
            updated_users << user_to_hash(user) 
        end
        File.open('./lib/users.yml', 'w') { |f| f.write updated_users.to_yaml }
    end



end
