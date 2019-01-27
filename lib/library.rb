require 'date'

class Library
    STANDARD_VALIDITY_DAYS = 30
    attr_accessor :collection

    def initialize 
        @collection = YAML.load_file('./lib/data.yml') 
    end

    def get_book_index(book_title)
        title_author = @collection.map {|obj| obj[:item]}
        titles = title_author.map {|obj| obj[:title]}
        index =titles.index(book_title)
    end

    def title_author
        @collection.map {|obj| obj[:item]}
    end

    def is_available(book_title)
        index = get_book_index(book_title)
        @collection[index][:available] ? true : false
    end

    def set_return_date(book_title)
        index = get_book_index(book_title)
        @collection[index][:return_date] ? return_date : false
    end

    def return_date
        Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%Y/%m/%d')
    end

    def check_out(book_title)
        index = get_book_index(book_title)
        if @collection[index][:available] then
            @collection[index][:available] = false
            date_new = @collection[index][:return_date] = return_date
            File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
            success_hash = {return_date: date_new, status: "borrowed"}
            title_author[index].merge(success_hash)
        else
            failure_hash = {date: Date.today.strftime('%Y/%m/%d'), status: "failed"}
            title_author[index].merge(failure_hash)
        end
    end

    def check_in(book_title)
        index = get_book_index(book_title)
        if @collection[index][:available] == false then
            @collection[index][:available] = true
            File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
            success_hash = {date: Date.today.strftime('%Y/%m/%d'), status: "returned"}
            title_author[index].merge(success_hash)
        else
            failure_hash = {date: Date.today.strftime('%Y/%m/%d'), status: "failed"}
            title_author[index].merge(failure_hash)
        end
    end
end








