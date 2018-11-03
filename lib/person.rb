require 'date'
require './lib/library.rb'
class  Person
    attr_accessor :user_id, :pin_code, :reading_list
    def initialize(params = {})
        @reading_list = []
        set_user_parameters()
               
    end

    def available_books(library)
        library.display_available_books(library.collection)
    end

    def reading_list_return_dates(reading_list)
        due_dates = []
        reading_list.each do |book|
            due_dates << [book[:item][:title],book[:return_date]]
        end
        due_dates
    end

    def check_due_date(reading_list)
        expired_books = []
        reading_list.each do |book|
            Date.strptime(book[:return_date], '%Y-%m-%d') < Date.today ?  expired_books << book[:item][:title] : false
        end
        expired_books
    end

    private

    def set_user_parameters()
        @user_id = rand(100000..999999)
        @pin_code = rand(1000..9999)
    end
     
end

