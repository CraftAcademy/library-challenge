## Library Challenge
### the code

This challenge was an example of being contacted by a client with a fairly clear requirement. 

Create an app for data storage and inventory status. 
In this case a library that needed to track, store and review the status of their books.

A UI was not requested, only the logical side and data storage, so the majority of the work was done in Ruby.rb and stored in a YAML.yml file acting as the library.


### Requirement translated into USER STORIES
----

As the client
in order to keep track of inventory and show customer what's availible and if not, when.
Display books and authors.

As a visitor
in order to find what I am looking for
I want to display all books.

as a visitor 
in order to know when to give back the book
I want a reciept that tells me when I need to hand it back.

As a librarian, 
I want a system that can automatically update when book is borrowed.


### Dependencies
Rspec for unit testing and pry for debugging.

### Setup

 ⋅⋅* Download the code using git from https://github.com/Mljungho/library-challenge
⋅⋅* in terminal run ´bundle´ while stationed in the folder "library-challenge"
⋅⋅* run Rspec using the terminal `rspec './spec/library_fs_spec.rb'`

I noticed now that I have since I ran the test removed the instance "Book" that passed the spec to verify that a book needs both an author and a title, so the only spec I wrote is not longer functional... 



#### instructions

⋅⋅* The way this code is inteded to be tested is in IRB
⋅⋅* Enter `IRB` in the terminal to
⋅⋅* ´require `'./lib/person.rb'` in order to load the code
⋅⋅* `mathias = Person.new({:account => "mlj"})`
⋅⋅* `library = Library.new` => This will instanciate a library with availibe books
⋅⋅* the idea is to call on the method commands , such as borrow a book `library.borrow_book("Way of Kings")` but this methods calls for two arguments (1 argument given, expected 2). This makes sence since we need to check the book out using our account. However when i add two arguments `library.borrow_book("Way of Kings", "mlj")` the error message changes and tells me I have put one out of 0 arguments nececary (1 argument given, expected 0). 

#### Acknowledgements
Previous CA students for inspiration. 
special focus on AugustEnhager & maxarvid though tried not to plagarism.

#### Updates

Some of the functions are not working properly. 
I am unable to borrow a book from the library.
The code also lacks a UI, that could increase the ease for search functions for both client and customers of the library.

I focused mainly on the code instead of the user specs. It was a deliberate decition from my end.