## Library Challenge
### Week 1 Ruby challenge

This is a virtual library where we have created solutions for the library to store books, see documentation of the stored books and be able to search for books by title and author. We have also made it possible for the library to see a specific list for the books that are checked out to keep track of them. 
We have also created solutions for a customer to be able to see a list of all books and search for a certain book by both title and author. In order to loan a book of choice we have made it possible for the customer to checkout a book and then get the return date showed and also a solution for returning the book to the library. 

These are our user stories for the library:

As a library worker
In order to see range of books 
I need to be able to see a list of all the books 

As a library worker
In order to find the right book
I need to be able to search for both title and author

As a library worker
In order to see what books are checked out by customer 
I need to see a list of unvailable books

As a library
In order to get the checked out books back
We need to be able to have a time frame when it needs to be returned

As a customer
In order to see what books are available in the library
I need to be able to see a list of available books

As a customer
In order to find the book I want
I need to be able to search for both title and author

As a customer
In order to borrow the book I want
I need to be able to checkout the book

As a customer
In order to know when the book has to be returned
I need to see which date the book has to be return on 

As a customer
In order to return a book
I need to be able to check the book back in

### Dependencies
We have written this project in Ruby and used RSpec to uni-test our code to see that the functions work in an expected way

The Gems we have used is:
- rake
- rspec
- pry
- pry-byebug
- coveralls 
- rubocop

### Set-up
For this project you should use Ruby version 2.6.3
You can check your ruby version:
>$ rvm list

If you are using the wrong version, then you need to install 2.6.3
>$ rvm install 2.6.3

And then to use the corret version
>$ rvm use 2.6.3

Then run bundle to get all the required gems.
>$ bundle

### Instructions

### Acknowledgements 
- We have got inspiration from the Craft Academy demo by Faraz Naeem about how to search and use a yaml file.
<!-- https://drive.google.com/file/d/1Pwh_fvKHGFjz-sWJE03x6AGpTaWjE-8c/view?usp=sharing -->
- We also took inspiration from a demo by Thomas Ochman where he showed how to use a module for a specific method that will be used in a class. 
<!-- https://drive.google.com/file/d/19HDUds8gXl8dZV0fOXEH5e5-FUvUUz6c/view?ts=5e3d3389 -->
- We also want to give a big up to Jaime Cruz H. for giving us the "num" class. That got us up from a deep hole. 

### Updates/Improvement plans
What could be improved is that every customer should have a library account that shows what books the customer has checked out, stopping the customer from checking out a new book if another book is not return on time and setting a limited amount of books that a customer can borrow. 

### License:
#### MIT-license 






 
