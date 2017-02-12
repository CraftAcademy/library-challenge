##Library Challenge
###Week 1 Ruby challenge


##User commands for library part.

irb

load './lib/library.rb'

user = Library.new

user.all_books

user.available_books

user.person_checkout(book_id)

user.return_book(book_id)


##User commands for person part.

irb

load './lib/person.rb'

user = Person.new

user.borrowd_book_list

user.available_books
