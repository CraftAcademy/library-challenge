require "./lib/book.rb"
require "./lib/visitor.rb"
require "yaml"
require "date"

class Library
  attr_accessor :book, :available, :return_date, :visitor

  def create_book(args = {})
    @book = Book.new({ title: args[:title], author: args[:author] })
  end

  def add_book_to_inventory(available = true, return_date = nil)
    @book.nil? ? missing_book : add_book_to_yml_file(available, return_date)

    {
      status: true,
      message: "#{@book.title} by #{@book.author} added to the inventory"
    }
  end

  def find_book(args = {})
    if args[:title].nil?
      missing_title
    else
      result = search_book(title: args[:title], available: true)
      # binding.pry
      if result.nil?
        {
          status: false,
          message: "#{result[:book][:title]} not found"
        }
      else
        create_book(title: result[:book][:title], author: result[:book][:author])
        @available = result[:available]
        @return_date = result[:return_date]
        {
          status: true,
          message: "#{result[:book][:title]} found"
        }
      end
    end
  end

  def welcome_visitor(args = {})
    @visitor = Visitor.new(name: args[:name])
  end

  def lend_book
    result = search_book(title: @book.title, available: true)
    check_out_book(result)
    #Missing updating Visitor data 
    "#{@visitor.name} has to return #{@book.title} no later than #{@return_date}"
  end

  private

  def missing_book
    raise "A book is required"
  end

  def missing_title
    raise "A title is required"
  end

  def search_book(args = {})
    array = load_yml_file
    array.detect { |item| item[:book][:title].include?(args[:title]) && (item[:available] == args[:available])}
  end

  def add_book_to_yml_file(available, return_date)
    @available = available
    @return_date = return_date

    new_book = {
      book: { title: @book.title,
              author: @book.author },
      available: @available,
      return_date: @return_date,
    }
    array = load_yml_file
    array.push new_book
    write_to_yml_file(array)
  end

  def check_out_book(args = {})
    @book.title = args[:book][:title]
    @book.author = args[:book][:author]
    @available = false
    @return_date = Date.today.next_month(1).strftime("%d/%m/%Y")
    item = {
      book: { title: @book.title,
              author: @book.author },
      available: @available,
      return_date: @return_date,
    }
    update_book(item)
  end

  def update_book(args = {})
    array = load_yml_file
    index = array.index {|item| item[:book][:title].include?(args[:book][:title]) && (item[:available] == true)}
    array[index][:available] = args[:available]
    array[index][:return_date] = args[:return_date]
    write_to_yml_file(array)
  end

  def load_yml_file
    YAML.load_file("./library_data.yml")
  end

  def write_to_yml_file(array)
    File.open("./library_data.yml", "w") { |file| file.write(array.to_yaml) }
  end
end
