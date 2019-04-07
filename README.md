# Objective 

We are approached by a newly built library:
 
 > "We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book."

 #### Learning objectives from Craft Academy
* Practice TDD to drive your development process

* Adapt to a new domain

* Work with data stored in hashes and perform

* Learn about YAML

* Learn about storing information in a text file

* Practice writing documentation

* Learn to write user stories

* Practice Pair programming

 
# Problem statement
The library needs a simple and flexible way of tracking the books in their posession, checking the availability status of books, modifying their stock and allowing it's visitors to check out books on their own.


# User stories

```
As a Library
In order to know how many books I have
I would like a list of all the books in my possession
```


* Create the YAML file (unique code for every book, name of who we give it)
* Create Library Class
* Create an instance variable books for Library class
* Create a method to search the YAML file by title, the method returns all data
* Create a method to search the YAML file by author, the method returns all data

```
As a Library
In order to serve my visitors efficiently
I would like to check out books for my visitors.
```

* Create a method that checks out the book using the index number. It pushes in the "available" and "return_date" values in the YAML file.
* Create a class double for Visitor class and add the function that pushes "borrowed_by" value into the YAML file.


```
As a Library
In order to make new books accesible to public
I would like to be able to add new books to the system.
```

* Create a method to add new entries to the YAML file


```
As a Visitor
In order to be able to choose
I would like to be able to search the list of books
```

* Create Visitor Class (attribute name)
* Create a method to read the YAML file (no name access)
* Create a method to search the YAML file by title (no name access)
* Create a method to search the YAML file by author (no name access)

```
As a Visitor
In order not to wait in the line
I would like to be able to checkout a book by myself and know when to return it
```
* Create a method that lets a visitor checkout the book and prints a message with the return date

```
As a Library
In order to have my book list updated at all times
I would like to have a feature for returning books.
```

* Create a return_book method

```
As a Visitor
In order to know what books I am borrowing at the moment
I would like to have a feature to provide me a list of books and return dates.
```

* Create my_books method

# Authors' view on the scope

<p>This is our first project using YAML. We noticed that the YAML file is doing us a favour and is acting like a bridge between Visitor and Library class. Therefore, we agreed that there is no need connecting these two classes via code.</p>
<p>We just gave different access levels to the YAML file, based on the class that the methods are called upon.</p>

# Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on your Interactive Ruby Shell (IRB) system.

# Prerequisites

* You will need Ruby installed on your system.
* You will need Bundler installed on your system.
* You will need IRB installed on your system.


# Installing

Make sure you are in the project folder.

Run IRB in your Terminal:

`irb`
 

Load the visitor.rb file or library.rb file depending on what type of access you want to have.

`load './lib/visitor.rb'`

`load './lib/library.rb'`

You are good to go!

# Running the tests

After you fork the repository, run `bundle install` in your Terminal and make sure you are in the project folder. That should install RSPEC on your computer.

Then, from your Terminal go to the project folder and run `rspec`.

# Deployment
#### FROM THE VISITOR'S POINT OF VIEW

To create a library visitor, run

```
visitor = Visitor.new("name")
```

To view the list of books library has, run
```
visitor.view_books
```
To search a book by title, run
```
visitor.search_by_title("Book title or a part of it")
```

To search a book by author, run
```
visitor.search_by_author("Author's name and/or surname")
```

To checkout the book, run
```
visitor.checkout_book(book index number)
```
To see if you are currently borrowing any books, run

```
visitor.my_books
```

#### FROM THE LIBRARY'S POINT OF VIEW

To initialize a library run

```
library = Library.new
```

To search a book by title, run
```
library.search_by_title("Book title or a part of it")
```

To search a book by author, run
```
library.search_by_author("Author's name and/or surname")
```

To checkout the book, run
```
library.checkout_book(book index number, visitor's name)
```
To add a new book to your database, run
```
library.add_new_book(title, author)
```

To return a book, run
```
library.return_book(book index number)
```

# Built with

[Ruby](https://www.ruby-lang.org/en/) - The worlds best programming language.

# Tested with

[RSPEC](http://rspec.info) - Making TDD Productive and Fun.


# Authors

* **Zane Neikena** - [zanenkn](https://github.com/zanenkn)
* **George Tomaras** - [raptorf1](https://github.com/raptorf1)


# License

This project utilizes the MIT open-source license. https://opensource.org/licenses/MIT

# Acknowledgments

Kudos to [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2) for the README template 
