                #USER STORIES#

as the library staff
in order to have an overview of available books
we need to store all books availability in a file

as a visitor
in order to know if the book I like is available
I need to be able to read the availability list

as an app user
in order to identify the book in the list
I need to see the tittle and the author of the book

as the library admin
in order to keep track of our books
we need our visitors to checkout the books when they borrow them

as a visitor
in order to tell the library which book I am borrowing
I need to be able to easily checkout my book

as an app user
in order to know when a book should be returned
I need to be able to see the return date

as an app user
in order to make a book available again (return the book)
I need a check in functionality

as an app user
in order to know where the books are
we need a list with the books that every visitor have in their possession
-------
Functionalities:

have a library = list books - being able to search on it --> 

check out the books --> should make the book unavailable

when checking out the book --> return the book in 1 month
---------
Implementation:
files:
-library_search
-library_search_spec

classes:
-Library

methods:
-



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

##
All tests passing