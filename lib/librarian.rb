require 'date'
require 'yaml'

class Librarian
    attr_accessor :list

    def initialize
        @list = YAML.load_file('./lib/data.yml')
        
    end

    def check_availability(title)
        book = @list.detect { |hash| hash[:book][:title] == title }
        book[:available]
    end

    def check_out(title)

        # Display return for visitor
        book = @list.detect { |hash| hash[:book][:title] == title }
        book[:available] = false

        book[:return_date] = Date.today.next_month.strftime('%d/%m')
        print "Thanks for using our library, please return the book before: #{book[:return_date]}, Thanks!"
    end

    def check_return_date(title)
        book = @list.detect { |hash| hash[:book][:title] == title }
        book[:return_date]
    end

    private


end
