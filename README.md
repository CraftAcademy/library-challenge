The library challenge 2019
==========================

The core functionality of this program is to provide a way for the library to keep track of it's books, 
as well as being able to provide customers with the ability to browse a selection of books and check them out.
Both the library staff and the customers will also be aware of the return date.

## The code

The project consists of two main classes; `Library` and `User`.  

The **Library** contains methods:
* to load the books' data from a YAML file
* to list all books' titles and authors
* to push available books into an array
* to calculate a return date
* to write changes to a YAML file

The **User** contains methods:
* to list available books
* to search for books by title
* to search for books by author name
* to check out books
* to add books to account
* to display account's content

## Dependecies
The project is written in **Ruby** (v2.3.1).  
Testing is implemented with **RSpec** (v3.4.2).  
Gems used:  
 * `rake`
 * `rspec`
 * `pry`
 * `pry-byebug`
 * `coveralls`
 * `rubocop`

## Setup
### To obtain the code:  
`git clone https://github.com/shsteindorsson/library-challenge.git`  
or  
`git clone https://github.com/lucamarial/library-challenge.git`

### To install dependesies:
Assuming [Bundler](https://bundler.io/) is installed:  
Run  `bundler`  from the root folder of the project.

## To run tests
From the root folder of the project, run:  
`rspec`  

To run a specific test:  
`rspec spec/name-of-file_spec.rb`

## To run program in _irb_

From the root folder of the project, run:  
```
irb
```

To load `user.rb` file. run:
```ruby
load './lib/user.rb'
```

To create a instance of the `User` class, run:
```ruby
user = User.new
```

To display available books, run:
```ruby
user.find_available_books
```

To search for a specific book by title name, run:
```ruby
user.search_for_book_title(' search string ')
```

To search for a specific book by author name, run:
```ruby
user.search_for_book_author(' search string ')
```

To check out a book, run:
```ruby
user.checkout('Title of book', 'Author of book')
```

To display currently checked out books, run:
```ruby
user.display_account
```

## User stories
```
As a Library employee
In order to see a list of available books
I need access to a data of books
```
```
As a Library employee
In order to see if a book is available 
I need to be able see a list of available books* (Both title and author)    
```
\* _"can see if a list of books is available"_ is an unclear request  

```
As a user
In order to see whether a specific book is available
I need a search method to query the database
```
```
As a user
In order to pick a book
I need to see which books are available
```
```
As a user
In order to borrow a book
I need an account
```
```
As a user
In order to know when to return a book
I need my account to store my books
```
```
As a user
In order to check out a book
I need a checkout process
```
```
As a library employee
In order to have books returned on time
I need a process to calculate the return date
```
```
As a user
In order to return the book on time
I need the checkout process to return a return date
```

## Acknowledgements
Code for search methods and loading of Yaml files was partially acquired from the course material from [Craft Academy](https://craftacademy.se).

## Contributors
[Luca Lobacher](https://github.com/lucamarial)  

[Sverrir Steindorsson](https://github.com/shsteindorsson)

## License
This project is made available under the [MIT-License](https://opensource.org/licenses/MIT).

<br>

![](https://raw.githubusercontent.com/shsteindorsson/shsteindorsson.github.io/master/images/craft.jpg)