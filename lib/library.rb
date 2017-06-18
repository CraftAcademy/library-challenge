require 'yaml'

class Library
attr_accessor :title, :author,  :available, :return_date, :item

def initialize (title, author, available, return_date, item)
  @title = title
  @author = author
  @available = available
  @return_date = return_date
  @item = item


def search_title(title)
  puts "Title #{title}"
end

end

end
