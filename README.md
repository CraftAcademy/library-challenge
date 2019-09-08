The library challenge 2019
==========================

The core functionality of this program is to provide a sense of order for the library staff, 
as well as being able to provide customers with the ability to browse a selection of books and check them out.
Both the staff and the customers will also be aware of the return date.


## The code

The project consists of two main classes; `Library`and `User`.  

The **Library** contains methods:
* to load the books' data from a YAML file
* to list all books' titles and authors alphabetically
* to push available books into an array

The **User** contains methods:
*

The **Atm class** contains methods to:
 * check if it (the ATM) possesses sufficient funds 
 * check if the users account balance contains enough to perform the transaction
 * check if card's pin number matches, expiry date is valid and whether account is disabled
 * withdraw money

The **Account class** contains methods to:
  * set the expiry date
  * deactivate the users account

The **Person class** contains methods to:
  * enable the person to create an account
  * allow the person to make a deposit if an account exists 
  * allow the person to withdraw money if an account exists and it is balanced


## Dependecies
The project is written in **Ruby** (v2.3.1).  
Testing is implemented with **RSpec** (v3.4.2).  
Gems used: `rspec`

## Setup
### To obtain the code:  
`git clone https://github.com/shsteindorsson/library-challenge.git`  
`git clone https://github.com/lucamarial/library-challenge.git`

### To install dependesies:
Assuming [Bundler](https://bundler.io/) is installed:  
Run  `bundler`  from the root folder of the project.

## To run tests
From the root folder of the project, run:  
`rspec`  

To run a specific test:  
`rspec spec/name-of-file_spec.rb`

## The user stories

# User stories

As a Library employee
In order to see a list of available books
I need access to a data of books

As a Library employee
In order to see if a book is available 
I need to be able see a list of available books\* (Both *title* and *author*)  
 \* "can see if a list of books is available" is an unclear request  

As a user
In order to see whether a specific book is available
I need a search method to query the database

As a user
In order to pick a book
I need to see which books are available

As a user
In order to borrow a book
I need an account

As a user
In order to know when to return a book
I need my account to store my books

As a user
In order to check out a book
I need a checkout process

As a library employee
In order to have books returned on time
I need a process to calculate the return date

As a user
In order to return the book on time
I need the checkout process to return a return date
