require 'yaml'
require 'date'

class Books

  attr_accessor :collection

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
    collection.select { |obj| obj[:item][:title].include? "#{title}"  }
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
        collection[i][:return_date] = Date.today.next_month
        collection[i][:withdraw_by] = "#{name}"
      end
    end
      File.open('./lib/books_list.yml', 'w') { |f| f.write @collection.to_yaml }
  end

  def return_of_books(title_returned)
    i = 0
    while i < collection.length
      if collection[i][:item][:title] == "#{title_returned}"
        collection[i][:available] = true
        collection[i][:return_date] = ""
        collection[i][:withdraw_by] = ""
      end
    end
      File.open('./lib/books_list.yml', 'w') { |f| f.write @collection.to_yaml }
  end
  

end

=begin
    @collection.detect { |book| book[:item][:available] == true }

  [{:item=>{:title=>"Disappearing Earth", :author=>"Julia Phillips"}, 0
  :available=>true, 1
  :return_date=>nil},
 {:item=>{:title=>"A High Wind in Jamaica", :author=>"Richard Hughes"}, 1
  :available=>true, 
  :return_date=>nil},
 {:item=>{:title=>"Lot Stories", :author=>"Bryan Washington"}, 2
  :available=>true,
  :return_date=>nil},
 {:item=>{:title=>"Under a Starry Sky", :author=>"Laura Kemp"}, 3
  :available=>true,
  :return_date=>nil},
 {:item=>{:title=>"Thunder Bay", :author=>"Douglas Skelton"}, 4
  :available=>true,
  :return_date=>nil}]


  https://github.com/ViaMarcus/library-challenge/blob/master/lib/person.rb
  add user to the yaml
=end