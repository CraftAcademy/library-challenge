require 'yaml'
require 'date'

class Library
    attr_accessor :inventory

    def initialize
        @inventory = YAML.load_file('./lib/data.yml')
    end

    def find_book_title(search)
        @inventory.select { |obj| obj[:item][:title].include? search }
    end

    def find_book_author(search)
        @inventory.select { |obj| obj[:item][:author].include? search }
    end

    def set_available
        @inventory[0][:available] = false
    end

    def set_return_date
        Date.today.next_month.strftime('%F')
    end

    def update_data
        File.open('./lib/data.yml', 'w') { |f|h f.write inventory.to_yaml }
    end

    

end

