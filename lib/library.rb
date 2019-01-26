require 'yaml'

class Library
    attr_accessor :title, :author, :available, :return_date, :item

    def initialize
        @title = 'title'
        @author = 'author'
        @available = 'available'
        @return_date = 'return_date'
        @item = 'item'
    end


end