class Library
  LOAN_DURATION = 30
  attr_reader :book_list

  def initialize
    @book_list = YAML.load_file('./lib/data.yml')
  end

  def checkout(book_title)
    search_result = find(book_title)
    if search_result
      search_result[:available] = false
      return_date = Date.today + Library::LOAN_DURATION
      search_result[:return_date] = return_date.strftime("%d/%m/%y")
      save_to_disk
      {status: true, book: search_result, return_date: search_result[:return_date]}
    else
      {status: false, message:'No book is found'}
    end
  end

  def find(book_title)
    search_results = @book_list.select{|obj| obj[:item][:title].include? book_title}
    for book in search_results
      if (book[:item][:title].eql? book_title) && book[:available]
        return book
      end
    end
    {status: false}
  end

  def save_to_disk
    File.open('./lib/data.yml', 'w') { |f| f.write @book_list.to_yaml }
  end


end
