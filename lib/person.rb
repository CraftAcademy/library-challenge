

class  Person
    attr_accessor :user_id, :pin_code, :reading_list
    def initialize(params = {})
        @reading_list = []
        set_user_parameters()
               
    end

    private

    def set_user_parameters()
        @user_id = rand(100000..999999)
        @pin_code = rand(1000..9999)
    end
     
end

