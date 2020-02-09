Virtual Library project:



Project requirements
"We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book."

returns true if there is a list of books *
  Can search for book by title *
  Can search for book by author *
  list of available books *
  returns the date of return *
  returns the list of unavailable books*
  change book to unavailable*
  change book to unavailable*

Users stories:

As a Visitor/library
In order to search for books 
I would like to see if there is a catalog with items

As a Visitor/library
In order to search for books
I would like to search for a book by its title

As a Visitor/library
In order to search for books
I would like to search for a book by its Author

As a Visitor/library
In order to lend/borrow an available book
I would like to see a list of the available books

As a Visitor/library
In order to know when a book should be back at the library
I would like to see a return date

As a library
In order to communicate when a book is being borrowed
I would like to change the available status

As a library
In order to communicate when a book is being returned
I would like to change the available status














## Library Challenge
### Week 1 Ruby challenge

Instructions
-------
Read this entire README carefully and follow all instructions.

* Challenge time: this weekend, until Monday 9am
* Feel free to use Google, Stack Overflow, your notes, previously written code, books, etc. but work on your own
* If you refer to or have in whole or partially used the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution to GitHub and create a Pull Request**
* You must submit a Pull Request to this repository with your code by 9.30am Monday morning - before the stand-up


### Tasks
----

* Fork the challenge repo: https://github.com/CraftAcademy/library-challenge
* Run the command `bundle install` in the project directory to ensure you have all the gems
* Write your specs and implementation
* Be smart about using Git: commit and push often. Use feature branches.
* Create a Pull Request as soon as possible
* Read the comments from Hound and fix any issues that the service points out.

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
