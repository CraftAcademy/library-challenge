## Library Challenge

### The Project
This is a project to demonstrate how a simple Library system could work. We are using YAML for data persistence on book data and users. We have been using TDD to continuously make sure we are following the scope and having functional code. The library has search functions and books can checked out and returned. Effort has been put in to make it user friendly in terminal.

### Authors
- Marcus https://github.com/ViaMarcus
- Ali https://github.com/kermit-klein
- Theodora https://github.com/hashtagDora

### Dependencies/Installing

In order to use the library app you will need the following  
- Ruby 2.7.0  (https://github.com/rvm/ubuntu_rvm)  
- Rspec (included rspec in Gemfile)
- Rubocop (included rubocop in Gemfile)
- IRB or Pry (included pry in Gemfile)
- Bundler ($ gem install bundler)


### Terminal Instructions

Load files in IRB or Pry, All other files required by this file.
  ```
  >load “./lib/library.rb" 
  ```
Create Library. Books and Person objects are loaded from _data.yml_ and _users.yml_
  ```
  >lib = Library.new 
  ```
Create additional Person or Librarian
  ```
  >person = lib.add_user({name:"UserName"})
  >librarian = lib.add_user({name:"UserName",role:"librarian"}) 
  ```
List collection of books
  ```
  >lib.list_collection
  ```
Search for title in book collection
  ```
  >lib.find_title("The Shining")
  ```
Search for author in book collection
  ```
  >lib.find_title("Stephen King")
  ```
Search for category in book collection
  ```
  >lib.find_title("Horror")
  ```
Search for only available books
  ```
  >lib.find_available("Horror")
  ```
Search for only unavailable books (only librarian can see who loaned books,person can only see unavailable book info)
  ```
  >lib.find_unavailable(person)
  >lib.find_unavailable(librarian)
  ```
Select a specific book
  ```
  >book = lib.select_book("Exact Title of the Book")
  ```
Checkout book (person must be active user)
  ```
  >book.checkout(person)
  ```
View receipt of book loans 
  ```
  >person.show_receipts
  ```
Return book 
  ```
  >book.return_book
  ```
Return book from receipts (i = index of the book in person.show_receipts)
  ```
  >person.receipts[i][:book].return_book
  ```
### Object Models
\* = Mandatory on .new
#### Book
Item:
	title* = String  
	author* = String  
	category* = String   
available = Boolean  
loanee = Person  
return_date = Regex (dd/mm/yy)
#### Person
name: String*  
phone: String  
role: String ('User' is default)  
active: Boolean  
receipts: Hash containing a book object and Strings  
#### Library
collection: Array of Book  
users: Array of Person 


### User Stories Tested with RSpec

* As a librarian and a person,
In order to know which book I am looking at,
I want to know the title, author and category of the book.
* As a librarian,In order to have loaned books back
I need to set a return date.
* As a librarian, In order to have loaned books back,
I need to know who loaned book.
* As a person,In order to find a specific book,
I need to search the library book collection.
* As a person, In order to loan a book,
I need to checkout the book from library.
* As a person, In order to check when to return loaned books,
I need to see list/receipts of my loans.
* As a person, In order to return books before due time,
I need to able to return book to library collection.
* As a librarian, In order to make sure I can get my books back,
I want to keep the personal details of the loanees.
* As a librarian, In order to make sure books are not lost,
I want to keep unauthorized people from loaning books.


### License

MIT License
