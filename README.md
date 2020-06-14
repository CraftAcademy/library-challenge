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

Group Members : 
-Odean 
-Sima 

User Stories:

Stakeholder = Visitor
1# 
As a visitor
In order to be able to see the books that belong to the library
I need to see if a list of books exists.

2# 
As a Visitor 
In order to check the list of existed books I need to see list of books with title and author

3# 
As a Visitor 
In order to check the availibility status of the book I need a list of book to show if the book is available or not

4# 
As a Visitor 
In order to have the book I need to find the title and check out the book.

5# 
As a Visitor
 In order to return the book I need to know the return date(30 days after check out)

Stakeholder = Library 
1#
As a Library
In order to be able to see the books that belong to library
I need to see if a list of books exists.

2#
 As a Library 
 In order to check the list of existed books I need to see list of books with title and author

3#
 As a Library 
 In order to check the availibility status of the book I need a list of book to show if the book is available or not

4# 
As a library 
In order to know the books status I need to have the list of book with updated status.
