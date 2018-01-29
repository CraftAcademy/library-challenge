</a><img src="https://travis-ci.org/CraftAcademy/library-challenge.svg?branch=master">

# Library Challenge

A program that allows a user to interact with a virtual library

### Synopsis

This project is app that allows a user to checkout and return books through a provided database. We are learning Ruby and using RSpec for testing, and our pushes go via Travis and Coveralls to see if everything is working as it should.

### Motivation

We are learning Ruby and RSpec, this exercise made sense to implement and practice the skills we've learned so far. This exercise was chosen to show the true importance behind TTD (test driven development), and pair programming.

### Acknowledgements

We'd like to give a shout-out to our our coaches <a href="https://github.com/tochman">@tochman</a>, <a href="https://github.com/diraulo">@diraulo</a> and <a href="https://github.com/faraznaeem">@faraznaeem</a> for amazing support, we couldn't have done this without you <3

## Getting Started

Clone or download the repo and load the files in your terminal with irb.

### Load these files to run the application

**Library**

```irb
load './lib/library.rb'
=> true
```

**Person**

```irb
load './lib/person.rb'
=> true
```

### Setting it up

**Create a new person**

```irb
person = Person.new
=> #<Person:0x007fd030149940 @bookshelf=[], @has_overdue_books=false>
```

**Create a new library**

```irb
library = Library.new
=> #<Library:0x007fd0301412b8
```

### How to use

**See availble books**

Ask the library to list all the books it has that are available to be checked out.

```irb
library.list_available_books
=>(books)
```

**See all checked out books**

Ask the library to list all the books it has beed checked out.

```irb
library.list_available_books
=>(books)
```

**Search by author**

Ask the library to list all books by an author.

```irb
library.search_books_by_author('author name')
=> (books by author)
```

**Search by title**

Ask the library to list a book title.

```irb
library.search_books_by_title('book title')
=> (book title)
```
**Checkout a book**

Checkouts a book from the library and makes it unavailable to be checkout out until returned. Pass in the book and the person who is checking the book out.

```irb
library.checkout('book title' person)
=> ['book title']
```

**Check if book is overdue**

Looks to see if any previously checked out books are overdue.

```irb
person.check_overdue_books
=> false
```

**Return book**

Returns a previously checked out book to the library and makes it available to be checkout again.

```irb
person.return_book('book title')
=> 'book title'
```

