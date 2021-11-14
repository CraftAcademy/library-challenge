## Library Challenge
### Week 1 Ruby challenge

Requirements
-------

We are approached by a newly built library. They need an app to keep track of all their books. Luckily they have only received a handful of books so far and this is the perfect time to create a prototype application that will keep track of the books.

> *“We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book.”*

From the description above, I am able to extract the following user stories:

> As a library visitor/employee  
> In order to check if a book is available  
> I want to have a list of books with availability, title and author.

> As a book  
> In order to save my information  
> I need to have a title, an author, and availability

> As a library employee  
> In order to check a book availability  
> I want to store these books in a file

> As a library employee  
> In order to keep track of the books availability  
> I want to store information about who checked out the book

> As a library employee  
> In order to search of a book in my list  
> I want to be able to make a search by title

> As a library employee  
> In order to keep the books available to every visitor  
> I want to give 1 month period for lending a book

> As a visitor  
> In order to remember when I am supposed to return the book  
> I want to know which date I'm due to return the book

> As a person  
> In order to keep track of the books in my possession  
> I want to have a list of books with the return date

Code
-------

I'm trying to simulate basic operations in a library environment. I'm simulating adding books to an inventory (yml file), search for a book by title, lending a book to a visitor...

Setup
-------

A Gemfile is present with all the dependencies needed for this project.
Choose a folder where you want to download this project, then open your terminal in it:

> git clone https://github.com/giacoletti/library-challenge

> cd library-challenge

> bundle install

You need to create an empty library_data.yml file too to make it work properly. (Improvements are on the way)

Instructions
-------

You can try this software in your favorite ruby shell (pry or irb):

```ruby 
3.0.0 :001 > require "yaml"
 => true 
3.0.0 :002 > require "./lib/book.rb"
 => true 
3.0.0 :003 > require "./lib/library.rb"
 => true 
3.0.0 :004 > require "./lib/visitor.rb"
 => false 

3.0.0 :006 > kista_library = Library.new
 => #<Library:0x00005651ec9a4568> 
3.0.0 :007 > kista_library.create_book(title: "1984", author: "George Orwell")
 => #<Book:0x00005651ec96fb38 @author="George Orwell", @title="1984"> 
3.0.0 :008 > kista_library.book
 => #<Book:0x00005651ec96fb38 @author="George Orwell", @title="1984"> 
3.0.0 :009 > kista_library.book.author
 => "George Orwell" 
3.0.0 :010 > kista_library.book.title
 => "1984" 
3.0.0 :011 > kista_library.add_book_to_inventory
 => {:status=>true, :message=>"1984 by George Orwell added to the inventory"} 

```

In our library_data.yml we'll have:

```yml
---
- :book:
    :title: '1984'
    :author: George Orwell
  :available: true
  :return_date: 

```

```ruby
3.0.0 :006 > kista_library.find_book(title: "1984")
 => {:status=>true, :message=>"1984 found"} 

```

We can lend a book:

```ruby
3.0.0 :007 > kista_library.visitor
 => nil 
3.0.0 :008 > kista_library.welcome_visitor(name: "Giorgio")
 => #<Visitor:0x000055f27fb5f348 @name="Giorgio"> 
3.0.0 :009 > kista_library.visitor
 => #<Visitor:0x000055f27fb5f348 @name="Giorgio"> 
3.0.0 :010 > kista_library.book
 => #<Book:0x000055f27fe06448 @author="George Orwell", @title="1984"> 
3.0.0 :012 > kista_library.visitor.create_yml_file
 => #<File:./Giorgio_data.yml> 
3.0.0 :013 > kista_library.lend_book
 => "Giorgio has to return 1984 no later than 15/12/2021" 

```

The Giorgio_data.yml file will be generated:

```yml
---
- :book:
    :title: '1984'
    :author: George Orwell
  :available: false
  :return_date: 15/12/2021

```

And the library_data.yml will be updated:

```yml
---
- :book:
    :title: '1984'
    :author: George Orwell
  :available: false
  :return_date: 15/12/2021

```

Improvement plans
-------

There is still some error handling to manage, some code refactory and some updates are needed with the already present functionalities, for example it's not possible to search for a book by author yet, the searching can be improved.
