require 'yaml'
require './lib/person'

require 'date'

class Books

  attr_accessor :collection, :name, :title

  def initialize
      @collection = YAML.load_file('./lib/books_list.yml')
  end
    

  def available_books
    i = 0
    while i < collection.length
      if collection[i][:available] == true
        puts (collection[i][:item][:title])
      end
      i = i +1
    end
  end

  def serch_by_title(title)
   x = collection.select { |obj| obj[:item][:title].include? "#{title}"  }

  end

  def serch_by_author(author)
    collection.select { |obj| obj[:item][:title].include? "#{author}"  }
  end

  def book_withdrawal(title_asked, name)
      #Set retreat of books
    i = 0
    while i < collection.length
      if collection[i][:item][:title] == "#{title_asked}"
        collection[i][:available] = false
        collection[i][:return_date] = Date.today.next_month.strftime('%m/%y')
        collection[i][:withdraw_by] = "#{name}"
         book_taked= collection[i]
      end
      i = i + 1
    end
      File.open('./lib/books_list.yml', 'w') { |f| f.write @collection.to_yaml }
      book_taked
  end

  def return_of_books(title_returned, name)
    i = 0
    while i < collection.length
      if collection[i][:item][:title] == "#{title_returned}"
        collection[i][:available] = true
        collection[i][:return_date] = nil
        collection[i][:withdraw_by] = nil
        book_returned= collection[i]

      end
      i = i + 1
    end
      File.open('./lib/books_list.yml', 'w') { |f| f.write @collection.to_yaml }
      book_returned
  end

  def books_in_possession(name)
    #x = collection.select { |obj| obj[:item][:withdraw_by].include? "#{name}"}

  end
  

end
