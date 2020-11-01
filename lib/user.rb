
class User
    attr_accessor :user, :return_date

    def initialize(attr = {})
        @user = 'Paulina'
        @return_date = Date.today.next_month(1).strftime("%m/%y")
    end
    
end

