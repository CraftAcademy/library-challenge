class Library
    STANDARD_VALIDITY_DAYS = 30
    attr_accessor :collection, :person

    def initialize 
        @collection = YAML.load_file('./lib/data.yml') 
        @person = person
    end

    def display_title_author
        @collection.map {|obj| obj[:item]}
    end

    def is_available(book_title)
        title_author = @collection.map {|obj| obj[:item]}
        titles = title_author.map {|obj| obj[:title]}
        index =titles.index(book_title)
        @collection[index][:available] ? true : false
    end

    def has_return_date(book_title)
        title_author = @collection.map {|obj| obj[:item]}
        titles = title_author.map {|obj| obj[:title]}
        index =titles.index(book_title)
        @collection[index][:return_date] ? return_date : false
    end

    def return_date
        Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%Y/%m/%d')
    end


    def check_out(book_title)
        title_author = @collection.map {|obj| obj[:item]}
        titles = title_author.map {|obj| obj[:title]}
        index =titles.index(book_title)
        if @collection[index][:available] then
            @collection[index][:available] = false
            @collection[index][:return_date] = return_date
            File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
            else
                false
        end
    end

    def check_in(book_title)
        title_author = @collection.map {|obj| obj[:item]}
        titles = title_author.map {|obj| obj[:title]}
        index =titles.index(book_title)
        @collection[index][:available] = true
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
        true
    end

    #def unavailable_book
        #raise RuntimeError, 'The selected book is not available'
    #end

    
    

    
end








