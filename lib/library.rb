require 'yaml'

class Library

    attr_accessor :collection, :collection_books, :collection_available

    def initialize     
        @collection = YAML.load_file('./lib/data.yml')
    end

    def search_title(book)
        @search_result = collection.select { |obj| obj[:item][:title].include? book }
        @search_result == [] ? no_titles_found : @search_result
    end

    def search_author(book)
        @search_result = collection.select { |obj| obj[:item][:author].include? book }
        @search_result == [] ? no_authors_found : @search_result
    end

    def perform_checkout(selected)
        @collection[@selected][:@selected][:available] = false
        return_date = Date.today >> 1
        return_date.to_s
        @collection[@selected][:return_date] = return_date
        @collection
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
    end

    def checkin(selected)
        @selected = selected_book
        @collection[@selected][:available] = true
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
    end

    def available_books_number
        @available_books_number = (@collection.select { |obj| obj[:available] == true  }).length
    end
 
    def available_books_titles(title)
        @available_books_titles = @collection.select { |obj| obj[:item][:title].include? title }
    end

    def no_titles_found
        print 'No titles matches your search'
    end

    def available_books_authors(author)
        @available_books_authors = @collection.select { |obj| obj[:item][:author].include? author }
    end

    def no_authors_found
        print 'No author matches your search'
    end



    def checkout(visitor)
        case
        when incorrect_username?(username)
          { status: false, message: 'Incorrect username', date: Date.today }
        when incorrect_password?(password)
            { status: false, message: 'Incorrect password', date: Date.today }
        when available_false?(available)
          { status: false, message: 'Book not available', date: Date.today }
        else 
          perform_checkout(username, password, available)
        end
    end
        
end