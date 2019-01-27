# Library weekend challenge

## code examples

These are some code examples of a yaml file in irb, and how to access or change some values.
```ruby
2.6.0 :003 > collection = YAML.load_file('./lib/books.yml
')
 => [{:item=>{:title=>"Harry Potter The Deathly Hallows", :author=>"J.K Rowling"}, :available=>false, :return_date=>"20.02.2019"}, {:item=>{:title=>"Game of thrones ICE AND FIRE", :author=>"George R.R Martin"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter The Philosopher's Stone", :author=>"J. K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter The Chamber of Secrets", :author=>"J. K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter The Prisoner of Azkaban", :author=>"J. K. Rowling"}, :available=>true, :return_date=>nil}]
 2.6.0 :004 > collection[0][:available] = false
 => false 
```
## RSpec 
Test enviroment is set up and functional.

## As a programmer
In order to work in a test-driven way
I want to unit test my code with rspec.

## As a Library
In order to loan out books 
I want to be show if books are available or checked out.

## As a Library 
In order to show if books are available
I want to show when they will be returned if they are checked out.

## As a Library
In order to loan out books and keep track of them
I want to only loan out books to borrowers who have a library card or account.

## As a Library
In order to loan out books 
I want to only loan out books to persons who have valid library cards or accounts.

## As a Library
In order to loan out books
I want users to be able to search for books by keyword.

## As a Borrower
In order to check out books
I want to be able to see what books the library has in its collection.

## As a Borrower
In order to check out books
I want to be able to see if a book is checked out or available.

## As a Borrower
In order to check out books
I want to be able to see when a book that has been checked out will be returned.

## As a Borrower
In order to check out books
I want to be able to have a library card or account.





