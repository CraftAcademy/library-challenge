require 'yaml'
require 'date'

class Library
  attr_accessor :books

  def list_available
    books.select { |obj| obj[:available] == true }
  end

  def list_all
    books.select { |obj| obj[:item] }
  end


  def search_books
    books.select { |obj| obj[:item][:title]}
    if [:available] == false
    elsif [:available] == true
      look_up1[:available] = false
      look_up1[:return_date] = set_outdate
      change_books
    end
  end

  def check_outdate
    books.select { |obj| obj[:item][:title]}
    if [:available] == false
      return [:return_date]
    end
  end

  def set_outdate
    Date.next_month
  end

  def books
    YAML.load_file('./lib/books.yml')
  end

  def change_books
    File.open('./lib/books.yml', 'w') { |f| f.write books.to_yaml }
  end
end
