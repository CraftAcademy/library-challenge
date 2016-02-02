require 'date'

class Library
  attr_accessor :books #TODO duedate person status

  def initialize(options={})
    @books = options[:books] || []
  end

  def check_in(book)
    add = {title: book[:title],
           author: book[:author],
           status: :okay,
           person: :non,
           duedate: " "}
    @books.push add
  end

  def lend(title, user)
    book = @books.detect { |a| a[:title] == title[:title] }
    case
      when book[:status] == :lended then
        'Sorry, book is already with another reader'
      when user.portfolio.select { |a| a[:duedate] > Date.today.strftime('%F') } != [] then
        'Sorry, you have one overdue book to return'
      else
        book[:status] = :lended
        book[:person] = :MEEE
        book[:duedate] = set_duedate
    end
    book
  end


  def return(title)
    items = books.detect { |a| a[:title] == title }
    items[:status] = :okay
    items[:person] = :non
    items[:duedate] = duedate

    #TODO: command to replace the original hash / or delete it
  end

  def set_duedate
    Date.today.next_month.strftime('%F')
  end

end

