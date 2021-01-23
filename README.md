# Library Challenge
## Week 1 Ruby challenge

### Problem Statement
-------
A newly built library has a handful of books, but they have no system of keeping track of their books. 

With our book tracker, all books are stored in a 'database', with title and author as attributes. The librarian can whether they have the book available or if it's rented out. Consumers can rent books and will be given the deadline of book return, which is 1 month later.

### User Stories
-------
As a library
In order to keep track of my books
All books needs to be stored in one list

As a librarian
In order to know whether the book is available or not
He/she needs to be able to easily access this in the book list

As a reader
In order to find a good book
He/she needs to easily access the title

As a reader
In order to read
He/she needs to be able to rent a book

As a librarian
In order to ensure that the books will return within a reasonable time
Books need to be given a return_date on check out

As a reader
In order to know, when he/she should return the book.
The checkout process needs to tell the user of the return_date

###

### T

### Tips
----

##### Some hints:
  * A Person needs to have a list of books that he currently has in his possession. That list needs to include the return date.
  * The return date can be calculated using the `Date` object. Out of the box, there are methods you can use to add days to the current date.
  * Make use of `doubles` when writing your specs
  * Follow the [naming conventions/standards](https://craftacademy.gitbooks.io/coding-as-a-craft/content/extras/naming_standards.html) for methods and variables

### What we are looking for
----
##### I'm hoping to see that:
* You can take a problem set and write a well tested implementation on your own.
* You understand how to define Ruby Classes and work with objects.
* You understand how classes can interact with each other.
* You know how to make use of arrays, hashes, and associated methods to create dynamic lists.
* You know how to write specs and use them as a blueprint in your development.
* I can track your work by following you commit history - so please commit as soon you are done with a feature or when you have made a test pass.

##### In your Pull Request, I'm hoping to see:
* That you are testing the right thing in the right spec file.
* That all tests passing - green is good!
* High test coverage (above 95% is accepted)
* The code is easy to follow: every class has a clear responsibility, methods are short, code is nicely formatted, etc.
* The `README.md` includes information on how to use your solution with command examples in `irb`. (Feel free to remove this text)


**Happy coding!**
