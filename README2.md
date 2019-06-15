# LIBRARY CHALLANGE

## Summary
This is a pair-programming project to simulate Automatic Teller Machine functionality.  As new bootcamp students, our goals are to fully appreciate our programs and coordinate our work using agile principles.

## Objectives
* 
* 
* 


### Problem statement


## User Stories

````
As a librarian
In order to keep order of the library
I would like to get an app that keeps track of our borrowing system
````
````
As a librarian
In order to keep track our books
I would like to know if the book is avaiable or borrowed of a visitor
````
````
As a visitor
In order to borrow a book
I would need to know if the library has the book I'm looking for
````
````
As a visitor
In order to know if the book is the correct one
I would like to know both the title and the author of the book
````
````
As a librarian
In order to know which books that our borrowed
I need the visitor to check out the book after finding it
````
````
As a librarian
In order to get my books back in time (one month)
I would like to know when the visitor is expected to handle the book back
````
````
As a visitor
In order to not get fines
I would like to know when I need to return the book
````

### Prerequisites
* Ruby 2.6.3
* Rspec 3.8.0

### Installing
To check if your Ruby version is sufficient, run ```rvm list``` or ```ruby -v```.  If necessary, switch to v2.6.3 with ruby version manager ```rvm --default use ruby-2.6.3```.  Otherwise, use RVM to perform a fresh Ruby install.

To install RSpec, ensure the Gemfile from the repository is located in the root folder and run RVM command ```bundle install```.

### Testing
Script files are located in the ```lib``` folder, and testing files are located in the ```spec``` folder.  To run tests, run ```rspec``` in root folder.  Testing is organized by class: Person, Atm, and Account.  Additional testing is appended to the end looking at class instance interactions, such as between Person and Atm.

## Authors

* **Ahlquist, Julie** - [julieahlquist](https://github.com/julieahlquist)
* **Westerberg Erik** - [erikwesterberg](https://github.com/erikwesterberg)

# Acknowledgments
Thank you to Craft Academy in Stockholm, Sweden for crafting this challenge.

Kudos to PurpleBooth for the README template https://gist.github.com/PurpleBooth/109311bb0361f32d87a2



As a library
In order to know what books do I have
I need to have a list of all the books

As a library
In order to keep track of the books
I need to be able to store the books in different categories

As a library
In order to loan out books
I need to be check if the books are availble

As a library
In order to NOT loan out books
I need to be check if the books NOT are availble

1 -As a library
In order to know if a book has not be returned
I need to be able to check for for exp date

2- As a library
In order to know if a book when the book was loaned
I need to be able to check loan date

1+2=3?-As a library
In order to know the current state of an book
I need to be able to check the status of a loan(loan, exp date)

As a library 
In order to get the books back
I must be able to set a return date(1month?)

As a library
In order to manage my books
I need to set state to avaible/not avaible

As a visitor
In order to get the book im looking for
I need to be able to check for title

As a visitor
In order to know when to return the book
I need to be able to know when to return the book

As a visitor
In order to loan a book
I need to be able to loan the book

As a visitor
In order to NOT loan a book
I need to be able to NOT loan the book
