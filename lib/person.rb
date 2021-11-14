require "date"  #irb syntax for initializing calsses ATM challenge: "> person = Person.new({:name => "Mathias"})"


class Person
    attr_accessor :author, :title, :on_hand

    def initialize(args = {}) #author, title
        @author = set_author(args[:author])
        @title = set_title(args[:title])

    end

    private

    def missing_name
        raise "A title is required"
      end
    
      def missin_author
        raise "An author is needed"
      end

      def set_title(title)
        title == nil ? missing_name : title
      end

      def set_author(writer)
        author == nil ? missin_author : author
      end

end