## Library Challenge
### Week 1 Ruby challenge


**PROJECT TITLE :** 
# LIBRARY CHALLENGE

**The Project:**

This project will allow us to create a library app so visitors can borrow and return books. It will include all the features such as: searching for book by title, checking availability and being able to know the return due date for each book.
The project is done by Test Driven Development technique. Every feature added after they have passed testing.

**Authors:**

  Git Profiles:

https://github.com/PaulineBA/library-challenge

https://github.com/erikbjoern/library-challenge


Dependencies/Installing:
In order to use the app you will need the following;

-- Ruby (check https://github.com/rvm/ubuntu_rvm)

-- Bundler ($ gem install bundler)

-- Rspec (include rspec in Gemfile)

-- IRB or Pry (check https://github.com/pry/pry)



To download
git clone To download

git clone
https://github.com/erikbjoern/library-challenge
or
 https://github.com/PaulineBA/atm_challenge_2020.git


## Terminal Instructions

Load files in IRB or Pry

```
>load “visitor.rb”  

```

Create Visitor

```
>visitor = Visitor.new  
```

Check-out book

```
>check_out_book 
```

Check-in book
```
>check_in_book
```
Return date
>return_date


## **User stories**

  
As a user  
In order to browse the library content  
I want to have a list of all books in the library

As a user  
In order to know if the library has a specific book  
I want to be able to search for a title

As a user  
In order to know if the book is available  
I want the availability of the book to be displayed

As a user  
In order to borrow the book  
I want to be able to check out the book

As a library owner  
In order to let other visitors know a book is currently borrowed  
I want the status of checked-out books to be 'unavailable'

As a user  
In order to know when the book is due  
I want a receipt to state the return date

As a user  
In order to return a book  
I want to be able to check in the book again

As a library owner  
In order to let other visitors know a book is available again
I want the status of checked-in books to be 'available'


