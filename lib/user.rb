class User
    attr_accessor :user

    def initialize(attr = {})
        @user = 'Paulina'
    end
    
    def user_name(user)
        @user = user
    end



end
