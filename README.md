# Library Challenge - Week 1 Ruby challenge

## Description
---
This repo contains the first weekend challenge of the [Craft Academy Bootcamp](https://craftacademy.se/english/curriculum/), by April 2019 Cohort. During one weekend, we were asked to create the back-end system of an app for a library - in Ruby Programming language. 

Pair programmed by [leiter007](https://github.com/leiter007) & [snailcoder1](https://github.com/SnailCoder1).

## Requirements and User Stories
-------
Full description of requirements and corresponding user stories can be found in the markdown file located [HERE](https://github.com/leiter007/library-challenge/blob/master/user_stories.md)

## User Instructions
----
Below follows instructions on how to use the application - both from the Library operators perspective, as well as that of the visitors

### 1. Library operators
After loading the library.rb file, a new library can be initiated - displaying the full YAML database/array of books: 
````
2.6.0 :001 > require 'yaml'
 => true 
2.6.0 :002 > load 'lib/library.rb'
 => true 
2.6.0 :003 > library = Library.new
 => #<Library:0x00007ff371161798 @collection=[{:item=>0, :title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil, :borrowed_by=>nil}, {:item=>1, :title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström", :available=>false, :return_date=>"2019-05-25", :borrowed_by=>nil}, {:item=>2, :title=>"Osynligt med Alfons", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil, :borrowed_by=>nil}, {:item=>3, :title=>"Pippi Långstrump", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil, :borrowed_by=>nil}, {:item=>4, :title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil, :borrowed_by=>nil}]> 
````
As a library operator, I can show books that are available to borrow - and those that are already borrowed by customers:

```
2.6.0 :005 > library.show_available_books
 => [{:item=>0, :title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil, :borrowed_by=>nil}, {:item=>2, :title=>"Osynligt med Alfons", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil, :borrowed_by=>nil}, {:item=>3, :title=>"Pippi Långstrump", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil, :borrowed_by=>nil}, {:item=>4, :title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil, :borrowed_by=>nil}]

2.6.0 :006 > library.show_non_available_books
 => [{:item=>1, :title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström", :available=>false, :return_date=>"2019-05-25", :borrowed_by=>nil}] 
 ```
 As a library operator, I can also search books from the entire database - either on parts of a title, or parts of an author's name:
 ```
2.6.0 :011 > library.search_book_by_title("Alfons")
 => [{:item=>0, :title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil, :borrowed_by=>nil}, {:item=>2, :title=>"Osynligt med Alfons", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil, :borrowed_by=>nil}]

2.6.0 :012 > library.search_book_by_author("Bergström")
 => [{:item=>0, :title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil, :borrowed_by=>nil}, {:item=>1, :title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström", :available=>false, :return_date=>"2019-05-25", :borrowed_by=>nil}, {:item=>2, :title=>"Osynligt med Alfons", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil, :borrowed_by=>nil}]
 ```
### 2. Library visitors
After loading the person.rb file, a new person/visitor can be initiated - requiring a name on initialize:

````
2.6.0 :001 > require 'yaml'
 => true 
2.6.0 :002 > load 'lib/person.rb'
 => true 
2.6.0 :003 > person = Person.new("Boa")
 => #<Person:0x00007fc9139b5008 @name="Boa">
````
To see which books are available for me, I can either use the show_books method or search_by_title or author - similar as an operator but only showing available books:

````
2.6.0 :004 > person.show_books
Nr:0 - Alfons och soldatpappan -by:Gunilla Bergström
Nr:2 - Osynligt med Alfons -by:Gunilla Bergström
Nr:3 - Pippi Långstrump -by:Astrid Lindgren
Nr:4 - Pippi Långstrump går ombord -by:Astrid Lindgren

2.6.0 :005 > person.search_book_by_title("Pippi")
Nr:3 - Pippi Långstrump -by:Astrid Lindgren
Nr:4 - Pippi Långstrump går ombord -by:Astrid Lindgren

2.6.0 :006 > person.search_book_by_title("Alfons")
Nr:0 - Alfons och soldatpappan -by:Gunilla Bergström
Nr:2 - Osynligt med Alfons -by:Gunilla Bergström
````
When deciding what to borrow, I can simply enter checkout_book as a method and type in the item number. If something goes wrong, I get an error message. But if all goes well, I can see when I need to return the book:

````
2.6.0 :007 > person.checkout_book(3)
 => "You have borrowed Pippi Långstrump. Please return it by 2019-05-08"

2.6.0 :008 > person.checkout_book(3)
 => "You have already borrowed this book" 

2.6.0 :009 > person.checkout_book(10)
 => "You have entered an incorrect item number, please try another" 
2.6.0 :010 > 
`````



