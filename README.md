# Library Challenge
## Code
App allows for a library to work with database of books stored in YAML file. It can show a list of books available for rent, changes status of books in database (avalible / not available) and automatically calculates the retun date for library visitor.

## Dependencies
  - coveralls
  - pry
  - rspec

## Setup
- Clone the repo on your local machine  
- cd into the program folder  
- run *bundle* command in the Terminal  

## Instructions
- cd into the program folder  
- run *irb* command in your Terminal  

Now we need to load the classes
- run *load './lib/library.rb'*
- run *load './lib/visitor.rb'*

Now you have access to the commands to lookup, rent and return a book.  
First we need to create a library
- run *lib = Library.new*

and a visitor
- run *lib.new_visitor*

Now you can see avalible books to rent if you
- run *lib.visitor.see_available*

To rent a book you like:
- run *lib.visitor.rent_the_book({title: '**specify title of the book here**'})*

To see what books you currently possess
- run *lib.visitor.books_in_possesion*

To return a book
- run *lib.visitor.return_the_book({title: '**specify title of the book here**'})*

And you can see it is returned if you 
- run *lib.visitor.see_available*


## License
The MIT license

# Client's task
*“We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book.”*


# User Stories
## 1
As a **Visitor**  
to see what **book**s I can borrow  
I want to see a list of **avalible books**

*Visitor - class  
book - object  
avalible_books - hash*  

## 2
As a Visitor  
to know when to return a book  
I want to get a receipt of what books and when

*receipt - object*  

## 3
As a Visitor  
to be able to return my books  
i need to posses the books  

*books_in_possession - array*

## 4
As a Library 
to see what books we have and what are lended  
I want to see a **status (avalible, borrowed)** on each book  

*status - symbol :avalible / :borrowed*  

## 5
As the Library  
To be able to lend a book  
The book need to be available  

## 6
As a Library  
to accsess the **library** database  
I want to have it in a separate file  

*library - hash*  


## 7
As a Library  
to manage library  
I want return date to be automatically installed to the 30 calendar days after it's been borrowed 