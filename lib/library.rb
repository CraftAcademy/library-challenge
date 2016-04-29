class Library
  LOAN_DURATION = 30
  attr_reader :book_list

  def initialize
    @book_list = YAML.load_file('./lib/data.yml')
  end

  def checkout(book_title)
    search_result = find(book_title)
    if search_result[:status] == :found
      @book_list.delete(search_result)
      return_date = Date.today + Library::LOAN_DURATION
      {status: true, book: search_result[:title], return_date: return_date.strftime("%d/%m/%y")}
    else
      {status: false, message:'No book is found'}
    end
  end

  def find(book_title)
    search_results = @book_list.select{|obj| obj[:item][:title].include? book_title}
    for book in search_results
      if book[:item][:title].eql? book_title
        return {status: true, book: book[:item]}
      end
    end
    return {status: false}
  end

end
