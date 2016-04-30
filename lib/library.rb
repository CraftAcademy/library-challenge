class Library
  LOAN_DURATION = 30
  attr_accessor:book_list

  def initialize
    @book_list = YAML.load_file('./lib/data.yml')
  end

  def checkout(book_title)
    search_result = find(book_title)
    if search_result[:status] == false
      {status: false, message:'No book is found'}
    elsif search_result[:available] == false
      {status: false, message:'No book is found'}
    else
      search_result[:available] = false
      search_result[:return_date] = return_date_text
      save_to_disk
      {status: true, book: search_result, return_date: search_result[:return_date]}
    end
  end

  def find(book_title)
    search_results = @book_list.select{|obj| obj[:item][:title].include? book_title}
    for book in search_results
      if (book[:item][:title].eql? book_title)
        return book
      end
    end
    {status: false}
  end

  def return_book(book_title)
    search_result = find(book_title)
    if search_result[:item][:title] == book_title
      search_result[:available] = true
      search_result[:return_date] = nil
      return search_result
    end
  end

  private

  def return_date_text
    return_date = Date.today + Library::LOAN_DURATION
    return_date_text = return_date.strftime("%d/%m/%y")
  end

  def save_to_disk
    File.open('./lib/data.yml', 'w') { |f| f.write @book_list.to_yaml }
  end



end
