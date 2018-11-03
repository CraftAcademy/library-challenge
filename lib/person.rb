require 'date'

class  Person
    attr_accessor :user_id, :pin_code, :reading_list
    def initialize(params = {})
        @reading_list = []
        set_user_parameters()
               
    end

    def check_due_date(reading_list)
        reading_list.each do |book|
            warning = Date.strptime(book[:return_date], '%y-%m-%d') > Date.today ? 'Following books are passed due date:' + book[:item][:title] : false
        end
        

    end

    private

    def set_user_parameters()
        @user_id = rand(100000..999999)
        @pin_code = rand(1000..9999)
    end
     
end

