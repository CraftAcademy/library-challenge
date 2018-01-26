class Library
  attr_accessor :collection
  def initialize
    @collection = YAML.load_file('./lib/data.yml')
  end

  def checkout_book(book, person)
    return_date = Date.today.next_month.strftime('%Y-%m-%d')
    book[:available] = false
    book[:return_date] = return_date
    person.books << book[:item].merge({return_date: return_date})
  end
end
