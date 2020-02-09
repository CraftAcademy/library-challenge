require 'library.rb'

class Person

    attr_accessor :username, :personal_id

    def initialize
        @username = nil
        @personal_id = nil
    end

    def set_username(usrname)
        @username = usrname
    end

    
end