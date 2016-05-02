##Library Challenge
###Week 1 Ruby challenge

Instructions
-------
This is a simulation for a library system. A person can borrow books from the
library. The library can lend books which are available.

###Prerequisite
* Ruby version : 2.2.3
This project uses Ruby 2.2.3 in the Gemfile. So you need to have Ruby 2.2.3
installed in your system.
```
$rvm list
```
So if you currently use Ruby 2.3.0, you can switch to Ruby 2.2.3 by the
following command.

```
$rvm use 2.2.3
```

###User stories

#####This Library program has the following user stories:

```
As an individual
In order to get my hands on a good book
I would like to see a list of books currently available in the library
with information about the title and author
```

```
As a library
In order to have good books to offer to the public
I would like to be able to have a collection of books
```

```
As a library
In order to have good books to offer to the public
I would like to be able to allow individuals to check out a book
```

```
As a library
In order to make the books available to many individuals
I would like to set a return date on every check out
and I would like that date to be 1 month from checkout date
```

```
As an individual
In order to avoid awkward moments at the library
I would like to know when my book is supposed to be returned
```

###How to use the program in irb
* Step 1: Go to the terminal in your Mac or Linux and start the irb with the
following command
```
$irb
```
* Step 2: Load YAML because it is used for loading the data files in yml formatted
```
> require 'yaml'
```
* Step 3: Load the person.rb files
```
> load './lib/person.rb'
```
* Step 4: Create a new person instance. Two books are loaded into the person's
bookshelf.
```
> person = Person.new
```
* Step 5: Create a new library instance. Books are loaded into the library.
```
> library = Library.new
```
* Step 6: Let the person check out a book 'Alfons och soldatpappan'
```
> person.checkout(title:'Alfons och soldatpappan', lib:library)
```
* Step 7: Show the person's bookshelf has got the book 'Alfons och soldatpappan'
```
> puts person.bookshelf
```
* Step 8: Return the book. The amount of books on the bookshelf should become
 2, which is shown in the output.
```
> person.return_book(title:'Alfons och soldatpappan', 'lib':library)
```
