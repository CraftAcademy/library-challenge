## Library Challenge
### Week 1 Ruby challenge

#### User stories
As a User
When looking at the list of books
I want to see the title and the author

As a visitor
In order to checkout a book
I need to see if it's available

As a visitor
When checking out a book
I want to know when to return it

As a library
In order to see available books
I want to know their status

As a library
When a visitor checks out a book
I want an update in the database

#### The Code

This is a simple application for a library to manage their books. Two different classes where created for this:

- The Library, where the options to show books by different criterias such as availability, title, author and all has been made available.

The option to check out / check in a book has also been created under the library class.

- The Visitor, where the option to see the list of books and the books checked out by the visitor has been given.

Both the Library and Visitor are using a YAML file for the database, which gets updated everytime a book is checked out our checked in.

#### Dependencies

Gemfile, Rake , Rspec, Pry, Pry-byebug, Coveralls and Rubocop where all part of the dependencies on set up.

#### Instructions
###### Commands in Terminal

Load irb
```
$ irb
```

Load the required files
```
$ load './lib/library.rb'
$ load './lib/visitor.rb'
```

Create a new library
```
$ lib = Library.new
```

Create a new visitor
```
$ user = Visitor.new
```

Show the collection of books with all information
```
$ lib.collection / user.collection
```

Check out a book
```
$ lib.book_checkout
```

Check in a book
```
$ lib.book_checkin
```

Show a list of books with only title and author
```
$ lib.book_list
```

Sort books by only those available
```
$ lib.availability
```

Sort books by only those not available
```
$ lib.not_available
```

Show visitor list of books in their possesion with return date
```
$ user.my_list
```

#### Acknowledgments

In order to do this, we used CraftAcademy course material, we used information from the YAML demo. We also looked at our senior's code for indication if we were on the right track. We mostly looked at :

https://github.com/emtalen/library-challenge
https://github.com/jysmys/library-challenge

##### Updates / Improvements plans

- Create an account class for the library visitor to be able to better keep track of the books and return dates
- Continue testing the sad path
- Create a reminder for the visitor regarding return date.
- Create a better way to search the library.


--------------------------------------------------------
#### Licensed under MIT license
