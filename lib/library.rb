require 'data'

class Library
  attr_accesor :books :duedate  #TODO:status

  def initialize(options={})
    @books = []
    @duedate = set_due_date
  end

  def check_in(book) #TODO library if its needed or not !!!
    add = {item: book, status: :okay}
    @books.push add
  end

  def check_out(book,library,status)
    add = {item: book, status: :check_out, duedate: duedate}
    @books.push add
  end

  def set_due_date
    Date.today.next_month.strftime('%F')
  end

#TODO do not allow person to rent book if he has duedate from same library

end
