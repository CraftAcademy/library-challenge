require 'yaml'
class Library


  attr_accessor :book_list

  def initialize
    @book_list = YAML.load_file('./lib/data.yml')
  end

  def perform_check_out(book_id)
    book = @book_list.find {|b| b[:book_id] == book_id}
    if book[:available] == false
      return {status: false, message: 'book unavailable', book_id: book_id}
    else
      book[:available] = false
      book[:return_date] = Date.today.next_month
      return { status: true, message: 'check_out complete', book_id: book_id, date: Date.today, return_date: Date.today.next_month }
    end
  end

  # def perform_check_out_old(book_id)
  #   @book_list.each do |book|
  #     if book[:book_id] == book_id
  #       if book[:checked_out] == true
  #         return {status: false, message: 'book unavailable', book_id: book_id}
  #
  #       else
  #         book[:checked_out] = true
  #         return { status: true, message: 'check_out complete', book_id: book_id, date: Time.now }
  #       end
  #     end
  #   end
  # end

  def perform_return(book_id)
    book = @book_list.find {|b| b[:book_id] == book_id}
    if book[:available] == true
      return {status: false, message: 'book available, can not return', book_id: book_id}
    else
      book[:available] = true
      book[:return_date] = nil
      return { status: true, message: 'book returned', book_id: book_id, return_date: Date.today }
    end
  end
end
