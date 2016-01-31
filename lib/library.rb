require 'data'

class Library
  attr_accesor :books :duedate  #TODO:status

  def initialize(options={})
    @books = options[:books] || []
    @duedate = set_due_date
  end

  def check_in(book) #TODO library if its needed or not !!!
    add = {item: book, status: :okay}
    @books.push add
  end

  def lend(book,library,status)
    case
      when book[:status] = :checked_out then 'Sorry, book is already with another reader' #TODO can return the expected return date
      else
        add = {item: book, status: :check_out, lender: person, duedate: duedate}
        @books.push add
    end
  end

def return(book,person)
  books.detect do |book|    #TODO the problem with that method is it will stop at first book
      book[:status] = :checked_out
  end

  def set_due_date
    Date.today.next_month.strftime('%F')
  end

#TODO do not allow person to rent book if he has duedate from same library

end
