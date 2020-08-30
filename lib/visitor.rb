require 'yaml'
require 'date'
require './library.rb'

class Visitor

    attr_accessor :catalogue

    def checkout_book
        catalogue = YAML.load_file('./lib/data.yml')
        catalogue[0][:available] = false
        catalogue[0][:return_date] = Date.today.next_month.strftime('%d/%m/%y')
        File.open('./lib/data.yml', 'w') { |y| y.write catalogue.to_yaml }
        catalogue[0]
    end

    def return_book
        catalogue = YAML.load_file('./lib/data.yml')
        catalogue[0][:available] = true
        catalogue[0][:return_date] = nil
        File.open('./lib/data.yml', 'w') { |y| y.write catalogue.to_yaml }
        catalogue[0]
    end

    def show_return_date
        for i in 0..4
        when catalogue[0][:available] = false do
            puts catalogue[i][:item, :return_date]
        else
            return
        end
            
    end

=begin Testing out
    def checkout_specific_book
        catalogue = YAML.load_file('./lib/data.yml')
        catalogue[][:available] = false
        catalogue[][:return_date] = Date.today.next_month.strftime('%d/%m/%y')
        File.open('./lib/data.yml', 'w') { |y| y.write catalogue.to_yaml }
        catalogue[2]
    end
=end
end



