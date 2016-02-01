#require 'Book'
require 'Date'

class Library
 attr_accessor :books  # :duedate  #TODO:status

  def initialize(library)
    @books = []
  #  @duedate = set_due_date
  end

 def check_in(book) #TODO library if its needed or not !!!
    add = {item: book, status: :okay}
    @books.push add
  end

  def lend(title,person)
#    case
#      when book[:status] = :checked_out then 'Sorry, book is already with another reader' #TODO can return the expected return date
#      else
        items = books.detect{|a| a[:title] == title}
        add = {item: items, person: :himself, duedate: duedate}
       @books << add

  end

# def return(book,person)
# books.detect do |book|    #TODO the problem with that method is it will stop at first boo      book[:status] = :checked_out
#  end

 def duedate
    Date.today.next_month.strftime('%F')
  end
#
  end
