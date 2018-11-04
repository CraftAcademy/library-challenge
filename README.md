##Library Challenge
###Week 1 Ruby challenge

Instructions
-------
Read this entire README carefully and follow all instructions.

* Challenge time: this weekend, until Monday 9am
* Feel free to use Google, Stack Overflow, your notes, previously written code, books, etc. but work on your own
* If you refer to or have in whole or partially used the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution to GitHub and create a Pull Request**
* You must submit a Pull Request to this repository with your code by 9.30am Monday morning - before the stand-up

## Instructions on how to use this library
1. Create a library:
```lib = Library.new```
2. Update the collection if you have data in the YML file:
```lib.update_collection```
3. You can check the available books:
```lib.check_available_books```
4. You can add books to your collection:
```lib.add_book(title: 'red', author: 'yellow')```
5. Create a person class:
```person = Person.new(name: 'Hanna')```
6. If you want to rent a book from the library, you can use the rent method:
```person.rent_book(lib: lib, title: 'red')```
7. You can check the books you have rented and their return date:
```person.rented_books = {title: 'red', author: 'yellow', return_date: '12/04'}```
8. You can return your book to the library:
```person.return_book(lib: lib, title: 'red')```

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

As a Library
In order to have a good books to offer to the public
I would like to be able to add books to my collection

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
