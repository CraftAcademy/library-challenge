
class Library

  attr_accessor :book_list

  def initialize
    @book_list = [{name: "little women", author: "Jane Austen", book_id: 1234}]
  end

  def perform_check_out
    { status: true, message: 'check_out complete', book_id: 1234, date: Time.now.strftime('%Y-%m-%d_%H-%M-%S') }
  end
end
