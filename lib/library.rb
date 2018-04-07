
class Library

  attr_accessor :book_list

  def initialize
    @book_list = [
      {name: "little women", author: "Jane Austen", book_id: 1234, checked_out: false},
      {name: "The Hunger Games", author: "Suzanne Collins", book_id: 1235, checked_out: false},
      {name: "Crushing It", author: "Gary Vaynerchuk", book_id: 1236, checked_out: false},
      {name: "The Startup Way", author: "Eric Ries", book_id: 1237, checked_out: false},
      {name: "INSPIRED", author: "Marty Cagan", book_id: 1238, checked_out: false}
    ]
  end

  def perform_check_out(book_id)
    book = @book_list.find {|b| b[:book_id] == book_id}
    if book[:checked_out] == true
      return {status: false, message: 'book unavailable', book_id: book_id}
    else
      book[:checked_out] = true
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
end
