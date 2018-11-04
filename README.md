##Library Challenge

##Instructions

This is an app prototype for a newly built library.  In the app you can see a complete list of books and keep track of all the library's books. You're able to find out if a book is available to check out or not.  This app was built using the Ruby language and works in irb.


###User Stories
As a library
In order to keep control of books (title, author,available..)
I want to have a collection of the books

As a library
In order to see list of books available (title and author)
I want to see list of available books

As a library
In order to have see a specific book
I would like the visitor to be able to search for a specific book

As a library
In order to have good books to offer to the public
I would like to be able to allow individuals to check out a book

As a library
In order to get our book back
I want the return date to be one month after checkout and allow visitor to know when to return the book

### How to use the app
1. Open irb in terminal
  $ irb

2. Load the library file in irb.  This will give you access to all the methods in the library file.
  $ load 'lib/library.rb'

3. Load the person file in irb.  This will give you access to all the methods in the person file.
  $ load 'lib/person.rb'

4. Create the library class in irb.
  $ library = Library.new

5. Create the person class in irb.
  $ person = Person.new

6. Access the library collection.
  $ library.collection

7. Access which books are currently available to check out.
  *This function is in beta and currently doesn't work
  $ library.book_available

8. Search if library has specific book in collection.
  *This function is in beta and currently doesn't work
  $ library.book_search('Old Tractors and the Men Who Love Them')

9. Allows visitors to check out book if available and includes return date. Includes message that check out is successful.
  $ library.book_lend_out('He Died With A Falafel in His Hand')

### Created by
Johanna Andén
Jonathan Edwards

## Thanks to:
Noel Ryan
Greg Kallai