class Person

    attr_accessor :username, :personal_id

    def initialize
        @username = nil
        @personal_id = nil
    end

    def set_username(usrname)
        @username = usrname
    end

    def set_personal_id(input_personal_id)
        @personal_id = input_personal_id
    end
end