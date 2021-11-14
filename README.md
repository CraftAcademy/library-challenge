## Library Challenge

### The code

This challenge is created for logic side only (no user interface and no server side). Data are stored in YAML file.

I am supposed to imagine that I am approached by library and they have these requirements:
“We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book.”

### Requirements translated into USER STORIES

As a library  
In order to be able to inform our visitors about all books we have  
I want to display all books

As a visitor  
In order to take a book  
I want to see list of available books

As a visitor  
In order to choose a book  
I want to see the author and the title of available books

As a library  
In order to give the right book  
I want to see the author and the title of the book

As a visitor  
In order to take a book  
I want to be able to check out the book after finding the title I want yy

As a library  
In order to know when the book will be back  
I want to set the return date 1 month from the checkout day

As a visitor  
In order to return book on time  
I want to see return dates for each book in a list

As a library
In order to know which books are checked out by visitors  
I want to update file with availability infomation and retun dates

### Dependencies

Rspec for unit tests, pry for debugging

### Setup

Will be updated

### Instructions

For this programm there is no user interface. To use it follow these steps:

- make sure you are in right (library_challenge) directory
- type irb
- ``` require './lib/library'````
- ```library = Library.new ````
- To checkout a book (Harry Potter and Philosopher's Stone) you can write  
  ```library.checkout("Philos") ````
- and get output `"Visitor have checked out Harry Potter and Philosopher's Stone by J. K. Rowling and will return it before 2021-12-14 " `
- to find available books ```library.find_available_books ````
- and you will see available books ```=> [{:item=>{:title=>"Silk", :author=>"Aleksandro Bariko"}, :available=>true, :return_date=>nil}] ````

### Acknowledgements

For insparation previous Craft Academy student submissions were explored.
However, never tried just to copy anything.

### Updates

The code is never finished... Currently want to do more than I am able to do in just one weekend.
Most important - write a spec that checks whether YAML file is updated with a new data by creating a fake file,
implementing code, check if desired changes have been included and then discard the fake file.
