# Library Challenge 2019
The program lets you create a User and a Library, the User can browse the current list of library books, see which books are available and check out any desired available books.

## The code

#### Library
The **Library** class reads a list of books from a YAML-file and stores it in the hash *collection*.

*list_books* returns a list of all books and whether they are available to checkout or not.

*checkout* lets a visitor to the library check out a choosen book, adding a return date one month from today.

#### User
The **User** class creates a user with an array, *books_in_posession*, of the books checked out by the user. On initialization this array is empty.

*checkout_book* let's the user checkout a book from the library, and adds it to *books_in_posession* with the date the book should be returned to the library.

## Dependencies
Written in Ruby v2.3.1

Unit tests using RSpec v3.9

## Setup
#### Clone repository
```
git clone https://github.com/sundqvistjohan/library-challenge.git
cd library-challenge
```
or
```
git clone https://github.com/EevanR/library-challenge.git
cd library-challenge
```

#### Install dependencies
Install RSpec using bundler if desire to run testing:
```
bundle install
````

## Instructions
In a Ruby shell of your choice, (e.g. irb or pry):
```
load "lib/user.rb"
```

#### Create your objects
*<user> can be a name or ID of your choice*
```ruby
# Create a User
<user> = User.new
# Create a library
library = Library.new
```
#### Actions available to the user
```ruby
# See list of books and their availability
library.list_books
# Choose a Title and run checkout process
<user>.checkout_book(library, "Title of book")
# Check books you have already checked out, with Return Date
<user>.books_in_posession
# See updated book list and availabilities
library.list_books
```

## Acknowledgements
Thanks to CraftAcademy and its coaches for instructions and support. 

## Updates/Improvement plans
Book return process coming soon

## License
Created under the <a href="https://en.wikipedia.org/wiki/MIT_License">MIT License</a>.

## User stories
```
As a librarian
In order to manage the library's books
I want to have a list of the library’s books
```

```
As a library visitor
In order to see which books I can borrow from the library
I want to see a list of the library’s books
```

```
As a library visitor
In order to take home a book
I want to see if the book is available
```

```
As a library visitor
In order to take home a book
I want to be able to check out a book
```

```
As a librarian
In order to ensure books are returned
I want to set a latest return date within a month
```

```
As a library visitor
In order to avoid late fees
I want to know which date I need to return my checked-out book
```