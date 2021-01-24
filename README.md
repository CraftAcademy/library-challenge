# Library Challenge
## Week 1 Ruby challenge

### Problem Statement
-------
A newly built library does not have a system to track their books. 
We will build a system that features a list which stores all the books, along with their titles and authors.
The librarian can also check the availability of each book.
Visitors can rent books and will be able to see the required return date. When a book is rented, the return date will be listed in the system.

### Dependencies
-------
pry
pry-byebug
rspec

### Setup & instructions
-------
1) **bundle**
2) Open *irb* and **require './lib/librarian.rb'**
3) Initiate the classes:
3.1) **librarian = Librarian.new**
3.2) **visitor = Visitor.new**
4) Get list of books: **librarian.list**
5) Notice the titles, as they are used in all methods.
6) Check availability: **librarian.check_availability("title")**
7) Check out a book: **librarian.check_out("title", visitor)**
7.1) This will change availability of the book, set a return date, and add the book to visitor's rented_books attribute. 
8) Check return date: **librarian.check_return_date("title")**

### Acknowledgements
-------
https://makandracards.com/makandra/41094-testing-terminal-output-with-rspec
https://www.shortcutfoo.com/app/dojos/ruby-dates/cheatsheet


### Improvements
-------


### License
-------
Rspec - MIT license

### User stories
-------
As a librarian
In order to track my books
The librarian needs a list of all books
*book list = YAML file as librarian attribute*

As a librarian
In order the see the availability of the books
The librarian needs a easy way of checking the availability of a specific book
*checker method for availability*

As a visitor
In order to rent a book
They need to be able to check out a book
*book checkout method that changes availability and sets return date*

As a visitor
In order to receive a book
They need to have the book stored them
*rented_books attribute to visitor class*

As a visitor
In order for the visitor to know when the return date is
On book checkout it displays the return date
*checkout method gives return date*

As a librarian
In order to successfully rent out books
The librarian needs to check availability before doing the check out
*availability checker inside checkout method*
