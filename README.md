# Library Challenge
Code pairing: *Pierre Tiberi*, *Karolina Frostare*

## Work in progress (Code overview)
This program sets the foundation for an app that library staff an visitors can use to get a better overview of library assets. At the moment the functionality for bullet points in bold are available. When the app is complete a user will be able to:

* **be assigned a library card with an account number**
* **view a list of all library books**
* **search a book by title**
* **search a book by author**
* checkout book (if book is available to checkout, or else error message)
* upon checkout the book will get assigned a return date
* view a return date for books currently checked out
* view checked out books in user account
* return book to the library
* send a message if book has passed its return date
<br>
<br>

<img src="./Assets/library.jpg" width="400" height="200">

# User stories
*The app has been built with four requests in mind. These are the user stories of our customer.*

**Show a list of all books**<br>
As a user<br>
In order to check out a book<br>
I want to see a list of books with title and author

**Show book availability**<br>
As a library<br>
In order for visitors to check if a book is available or not<br>
We need a list that shows all books 

**Make possible to check out book**<br>
As a library<br>
In order for visitors to check out books<br>
We need an app for them to access the list of books

**Make possible to see checked out book's due date**<br>
As a visitor<br>
In order to return the books within a month of checkout<br>
I need an app that shows the date it is due

## Dependencies
| Ruby | Gems: Rspec, Pry-ByeBug | Yaml |

## Setup
To access this code visit [GitHub](https://github.com/kfrostare/library-challenge) repo and complete the following steps:

1. Fork the repo and clone
2. Have Ruby and Gem bundler installed
3. Utilize IRB to run program

## Instructions
Instructions for running in IRB.

**Library card** | Generates a new library card ID 

        Library card = User.new
*This will assign you a brand new user ID and show you the book list of currently borrowed books (0)*

## Acknowledgements
The material has been provided by [Craft Academy](learn.craftacademy.co) <br>
The app is being created in [Ruby](rubymonstas.org) <br>
The app is being tested in [Rspec](rspec.info) <br>
We would like to thank [Kayla Woodbury](https://github.com/kaylawoodbury) for helping us with the Ruby/Yaml- connection

## Updates/Improvement Plans
There will be updates to this software shortly.

## License
MIT License