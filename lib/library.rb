require 'yaml'

class Library
    attr_accessor :collection, :available_books, :available_titles
    
    def initialize(attrs = {})
        @collection = YAML.load_file('./lib/data.yml')
        @available_books = []
        @available_titles = []
    end

end

# testing ground at the moment

# Search for an item based on title
    # def title_search(search_term)
    #     title_info = collection.detect { |av| av[:item][:title].include? search_term }
    # end

    # def title_availabilty
    #     title_info[:available] == true ? available_book(title_info[:item][:title]) : unavailable_book(title_info[:item][:title])
    # end

    # def available_book(avail_title)
    #     puts "#{avail_title} is available!"
    # end

    # def unavailable_book(avail_title)
    #     puts "#{avail_title} is unavailable!"
    # end

    # OR

    # def title_availability_search(search_word)
    #     title_return = collection.detect { |av| av[:item][:title].include? search_word }
    #     if title_return[:available] = true
    #         puts "#{title_return[:item][:title]} is available!"
    #     else
    #         puts "#{title_return[:item][:title]} is not available!"
    #     end
    # end


