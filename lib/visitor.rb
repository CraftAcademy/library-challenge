require 'yaml'
require 'date'
#require './library.rb'

class Visitor

    attr_accessor :catalogue

    def initialize 
        @catalogue = YAML.load_file('./lib/data.yml')
    end

    def checkout_book
        catalogue = YAML.load_file('./lib/data.yml')
        catalogue[0][:available] = false
        catalogue[0][:return_date] = Date.today.next_month.strftime('%d/%m/%y')
        File.open('./lib/data.yml', 'w') { |y| y.write catalogue.to_yaml }
        catalogue[0]
    end

    def show_return_date
        catalogue = YAML.load_file('./lib/data.yml')
        puts catalogue[0][:return_date]    
    end

    def return_book
        catalogue = YAML.load_file('./lib/data.yml')
        catalogue[0][:available] = true
        catalogue[0][:return_date] = nil
        File.open('./lib/data.yml', 'w') { |y| y.write catalogue.to_yaml }
        catalogue[0]
    end
end



