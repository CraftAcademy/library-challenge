# Library Challenge 2019
The program lets you create a User and a Library, the User can browse the current list of library books, see which books are available and check out any desired available books.

## The code
Creating a User class

Creating a Library class

## Dependencies
Written in Ruby v2.3.1

Unit tests using RSpec v3.9

## Setup
#### Clone repository
```
git clone https://github.com/sundqvistjohan/library-challenge.git
cd atm_challenge_2019
```
or
```
git clone https://github.com/EevanR/library-challenge.git
cd atm_challenge_2019
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
# 
```

## Acknowledgements
Special thanks to CraftAcademy and its coaches for instructions and support. Thanks to the creators of Ruby and RSPec, StackOverflow, adam-p for his <a href="https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet">Markdown Cheatsheet</a>

## Updates/Improvement plans
Book return process coming soon

## License
Created under the <a href="https://en.wikipedia.org/wiki/MIT_License">MIT License</a>.