require 'Book'
require 'Date'

class Library
 attr_accessor :books   #TODO duedate person status

  def initialize(library)
    @books = []
  end

 def check_in(book)
    add = {item: book, status: :okay, person: :non, duedate: " " }
    @books << add
 end

 def lend(title)
  case
    when books.detect{|a| a[:title] == title}[:status] = :lended
       then 'Sorry, book is already with another reader'
    when check = portfolio.select{|a| a[:duedate] > Date.today.strftime('%F')}
          if check != []
          then 'Sorry, you have one overdue book to return'
      else
        items = books.detect{|a| a[:title] == title}
        items[:status] = :lended
        items[:person] = :MEEE
        items[:dudate] = duedate

        #TODO: command to replace the original hash / or delete it
    end
 end

 def return(title)
        items = books.detect{|a| a[:title] == title}
        items[:status] = :okay
        items[:person] = :non
        items[:dudate] = duedate

        #TODO: command to replace the original hash / or delete it
  end

 def duedate
    Date.today.next_month.strftime('%F')
 end

end
