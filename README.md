##Library Challenge
###Week 1 Ruby challenge

Usage instructions
----------------------
This solution have two classes: library and patron.

Here are some features with some code examples from irb.
In these examples my_lib is an instance of the class Library
and my_pat is an instance from the class Patron

A patron can see a list of books he have borrowed
Ex: > my_pat.borrowed_books
 => [{:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"},
      :available=>false, :return_date=>"2017-05-09"},
      {:item=>{:title=>"Alfons och soldatpappan",
      :author=>"Gunilla Bergström"}, :available=>false,
      :return_date=>"2017-05-09"}]

The library have access to a collection or all their books
Ex: > my_lib.collection
 => [{:item=>{:title=>"Alfons och soldatpappan",
      :author=>"Gunilla Bergström"}, :available ...

They can also produce a list of available books to borrow (that patrons can see)
Ex: > my_lib.available_books
 => [{:item=>{:title=>"Alfons och soldatpappan", :author ...

It is also possible to check out and borrow a book that is available.
Ex: > my_pat.borrow_book( {item:{title: "Alfons och soldatpappan",
  author: "Gunilla Bergström"}, library: my_lib})
 => {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"},
        :available=>false, :return_date=>"2017-05-09"}

Should the book not be available a message about this is returned, along
with the date the book must be returned.
Ex: > my_pat.borrow_book( {item:{title: "Alfons och soldatpappan",
  author: "Gunilla Bergström"}, library: my_lib})
 => "Book is not available. It will be returned 2017-05-09"

Also if a patron tries to borrow a book that is not owned by the library a
message about this will appear
Ex: > my_pat.borrow_book( {item:{title: "Hello World",
  author: "Gunilla Bergström"}, library: my_lib})
 => "Library does not have this book"







Instructions
-------
Read this entire README carefully and follow all instructions.

* Challenge time: this weekend, until Monday 9am
* Feel free to use Google, Stack Overflow, your notes, previously written code, books, etc. but work on your own
* If you refer to or have in whole or partially used the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution to GitHub and create a Pull Request**
* You must submit a Pull Request to this repository with your code by 9.30am Monday morning - before the stand-up


###Learning objective
----
#####Write a Library program with the following user stories:

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

###Tasks
----

* Fork the challenge repo: https://github.com/CraftAcademy/library-challenge
* Run the command `bundle install` in the project directory to ensure you have all the gems
* Write your specs and implementation
* Be smart about using Git: commit and push often. Use feature branches.
* Create a Pull Request as soon as possible
* Read the comments from Hound and fix any issues that the service points out.

###Tips
----

#####Some hints:
  * A Person needs to have a list of books that he currently has in his possession. That list needs to include the return date.
  * The return date can be calculated using the `Date` object. Out of the box, there are methods you can use to add days to the current date.
  * Make use of `doubles` when writing your specs
  * Follow the [naming conventions/standards](https://craftacademy.gitbooks.io/coding-as-a-craft/content/extras/naming_standards.html) for methods and variables

###What we are looking for
----
#####I'm hoping to see that:
* You can take a problem set and write a well tested implementation on your own.
* You understand how to define Ruby Classes and work with objects.
* You understand how classes can interact with each other.
* You know how to make use of arrays, hashes, and associated methods to create dynamic lists.
* You know how to write specs and use them as a blueprint in your development.
* I can track your work by following you commit history - so please commit as soon you are done with a feature or when you have made a test pass.

#####In your Pull Request, I'm hoping to see:
* That you are testing the right thing in the right spec file.
* That all tests passing - green is good!
* High test coverage (above 95% is accepted)
* The code is easy to follow: every class has a clear responsibility, methods are short, code is nicely formatted, etc.
* The `README.md` includes information on how to use your solution with command examples in `irb`. (Feel free to remove this text)


**Happy coding!**
