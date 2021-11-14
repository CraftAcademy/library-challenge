

class Book

    attr_accessor :author, :title

    def initialize(author, title) #author, title
        @author = gets.chomp("Author")
        @title = gets.chomp("Title")

    end

    # def set_title(title)
    #     @title = title
    # end

    # def set_author(writer)
    #     @author = writer
    # end

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