require 'library'
require 'search_service'
require 'yaml' 
require 'date'

class Customer


    def available_books
        collection = YAML.load_file('./lib/inventory.yml')
        collection.select {|book| book[:available].eql? true }
    end

    def search_title(search_word)
        SearchService.find_title(search_word)
    end

    def search_author(search_word)
        SearchService.find_author(search_word)
    end

    def checkout_service(num)
        collection = YAML.load_file('./lib/inventory.yml')
        collection[(num)][:available]= false 
        collection[(num)][:return_date]= set_return_date 
        File.open('./lib/inventory.yml', "w") {|f| f.write collection.to_yaml}
        collection[(num)]
    end 

    def checkin_service(num)
        collection = YAML.load_file('./lib/inventory.yml')
        collection[(num)][:available]= true 
        collection[(num)][:return_date]= nil
        File.open('./lib/inventory.yml', "w") {|f| f.write collection.to_yaml}
        collection[(num)]
    end

    private

    def set_return_date
        Date.today.next_day(Library::DAYS_BEFORE_RETURN).strftime('%d/%m/%y')
    end

end