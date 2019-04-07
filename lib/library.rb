require 'yaml'

class Library

    attr_accessor :collection, :collection_books, :collection_available

    def initialize     
        @collection = YAML.load_file('./lib/data.yml')
    end


    def search(kaffe)
        @search_result = collection.select { |obj| obj[:item][:title].include? kaffe }
        @search_result == nil ? no_titles_found : @search_result
    end

    #om de "klickar" på en bok som inte finns inne ska det komma upp när den ska bli returnerad

    def perform_checkout(selected_title)
        @selected_title = selected_title
        @collection[@selected_title][:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
    end

    ##when checkout,or needs a list of checked out books with returning dates

    def checkin(selected_book)
        @selected_book = selected_book
        @collection[@selected_book][:available] = true
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
    end


    def available_books_number
        @available_books_number = (@collection.select { |obj| obj[:available] == true  }).length
    end
 
 
    def available_books_titles(title)
        title = title
        @available_books_titles = @collection.select { |obj| obj[:item][:title].include? title }
    end

    def no_titles_found
        print'inga titlar matchade din sökning'
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