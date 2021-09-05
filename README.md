## Library Challenge
### Week 1 Ruby challenge

<h2>The Code</h2>
This code has been written to simulate a virtual ATM, simulating the machine, an account on it, and a user interacting with the ATM.

<h2>Dependencies </h2>
The dependencies are as follows:
  RSPEC
  PRY
  pry-byebug
  coveralls
  
<h2>Setup</h2>
Launch irb

1. load './src/visitor.rb'
2. load './src/library.rb'
3. To create a library type: library = Library.New
4. To create a vistor type: visitor1 = Visitor.New(name)

<h2>Instructions</h2>
As a visitor to the library you can:
  Search for titles and authors using visitor1.search_for_title or visitor1.search_for_author
  See a list of available books using visitor1.list_available_books
  Checkout books using visitor1.checkout_book(title, name)
  Return a checked out book using visitor1.return_book(title)

As a librarian to the library you can:
  Search for titles and authors using library.search_for_title or visitor1.search_for_author
  See a list of available books using library.list_available_books
  See a list of all books using library.list_of_books

<h2>Acknowledgements</h2>
Course material at:
https://learn.craftacademy.co/courses/enrolled/645199

Craft Academy Cohort 2021

<h2>License</h2>
MIT License


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
