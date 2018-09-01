require 'yaml'

class Library

    attr_accessor :book_list

    def initialize
        @book_list = YAML.load_file('./lib/data.yml')
    end

    def book_search(search_term)
        book_return = book_list.detect { |bok| bok[:item][:title].include? search_term } #|| book_list.detect { |bok| bok[:item][:author].include? search_term }
        # print "Here is what we found:"
        # puts "Title: #{search_term[:item][:title]}"
        # puts "Author: #{search_term[:item][:author]}"
        # if search_term[:available] = false 
        # puts "Not available, back on #{search_term[:return_date]}"
        # else 
        #     puts "Available"
        # end
    end

end