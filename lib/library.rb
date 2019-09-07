require 'date'
require 'yaml'

class Library
    attr_accessor :available, :return_date, :title, :author

    STANDARD_VALIDITY_MONTHS = 1

    def initialize
    @available = :available
    @return_date = set_return_date
    end
#case def with !true statements like atm.rb

    def borrow(title, author, available)
        collection.select{|obj| obj[:item][:title].include?"Alfons och soldatpappan"}
        case
        when not_available?(available)
            { status: false, message: 'book not available', date: Date.today }
        else
            checkout(args)
        end
    end
=begin 
    def book_info
        yml = YAML::load(File.open('./lib/data.yml'))

        title = yml['book']['title']
        title.each{||}

=end
   def book_info
        yml = YAML.load_file '.lib/data.yml'
        yml.each_key { |key|
            title = yml[key]['title']
            author = yml[key]['author']
            available = yml[key]['available']
            puts "#{title}, Written by #{author}, available: #{available}"
    }
   end

    def checkout(args)
        collection.select {|book| book[:book][:title].include?"Catcher in the Rye"}
        collection[0][:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def return(args)
        title = args[:title]
        collection[0][:available] = true
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

end