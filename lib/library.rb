require 'yaml'

class Library

    def collection
        collection = YAML.load_file('./lib/data.yml') 
    end

    private
    def change_available_status #this code works in irb and rspec (do not touch)
        collection.select { |book| book[:item][:title].include? "Alfons och soldatpappan" }
        collection[0][:available] = false
        File.open('./lib/data.yml', 'w') { |book| book.write collection.to_yaml}
        collection.select { |book| book[:item][:title].include? "Alfons och soldatpappan" }
    end

    #[WIP]
=begin
    def something #look at the withdraw in the atm!??
    when unavaiable(book)
        {subject.book == checked_out ? unavailable : available} #????
    end

    def unavailable(book)
        @book == nil ? checked_out : available
    end
    
    def checked_out
        raise 'Book is checked out'
        collection[0][:available] = false
        File.open('./lib/data.yml', 'w') { |book| book.write collection.to_yaml}
    end

    def available(book) # the 0 needs to change depending on which book we are changing/checking.
        collection[0][:available] = true
        File.open('./lib/data.yml', 'w') { |book| book.write collection.to_yaml}
    end
=end
end