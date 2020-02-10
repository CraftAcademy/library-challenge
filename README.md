# User Stories


1. As the library, I would like to have an index of books, so that visitors and employees can see that we have books. 

2. As the library, I would like book information to include author and title, so that the book index can be searchable. 

3. As the library, I would like to know if a book is checked out, so that both employees and visitors know it is available / unavailable. 

4. As the library, I would like to know when a book is checked out, so that a return date 30 days in the future can be generated.

5. As a visitor, I would like to be able to check out a book, so that I can read it. 

6. As a visitor, I would like to know when my book return is due, so that I return the book on time.



### Potential Tests

- first test: are there books in the library?
- second test: can you search book author / title and get expected output
- third test: can you check state of book (available / not available)
- fourth test: can you see checkout date
- fifth test: can you generate return date
- sixth test: is inventory state updated when book checked out
- seventh test: is visitor notified of return date



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


##### Notable Collaborators

Karolina and Pierre for discussing user stories.
Paulo and I had some trouble designing tests to write to the YAML file and see how to do this in the IRB