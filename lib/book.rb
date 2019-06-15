

class Book
    attr_accessor :available, :title, :author, :due_date

    def initialize(attrs = {})
        set_name(attrs[:name])
        set_author(attrs[:author])
        @available = true
        @due_date = ""
    end


    def set_name(name)
        @name = name
    end

    def set_author(name)
        @author = author
    end
end
