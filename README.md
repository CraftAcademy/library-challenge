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

#### User Stories

As a library</br>
In order to know what books do I have</br>
I need to have a list of all the books in a file

As a library</br>
In order to provide books to visitors</br>
I need to be able to add books to the book file

As a library/visitor</br>
In order to identify a book</br>
That book needs to have a title and author

As a library</br>
In order to know what books we can let out</br>
we need to know which books are already unavailable 

As a visitor</br>
In order to take out a book</br>
I need to be able to search for it

As a visitor</br>
In order to take out a book</br>
I need to know if it is available

As a visitor</br>
In order to take out a book</br>
I need to be able check it out

As a visitor</br>
In order to return a book</br>
I need to be able check it in

As a library</br>
In order to have my books back</br>
I need to set a 1 month time limit

As a visitor</br>
In order to keep track of my books</br>
I need a list of the books I have in my possession

As a visitor</br>
In order to return a book</br>
I need to know when I have to return it
/how much time do I have left

As a library</br>
In order to keep track of the checked out book</br>
I need to know when they are going to be returned

As a visitor</br>
In order to take out an unavailable book</br>
I need to know when its being returned

#### Structure

Library Class

- [x] Add books to list
- [x] Access book list
- [x] Search for book title/author
- [] See book status
- [] Set due date on checked out books
- [] See book due dates
- [] Check in/out confirmations

# 
Visitor Class

- [x] Name
- [x] Access book list
- [?] Search for book tittle/author
- [?] See book status
- [?] Check out book
- [?] Check in book
- [?] Check in/out confirmations
- []List books in my posession
- []See book due dates


# 
 Book Class

- [x] Title
- [x] Author
- [x] Available/Unavailable
- [x] Due dates

#

### Instructions

- In order to interact with the Library app we first need to open Pry
```
pry
```

- Next we'll load our file
```
load './lib/visitor'
```
- We can now also create our library 
```
newLibrary = Library.new
```
This will create a new library with all the books available in our YAML file

- We can also create a user/visitor
```
newVisitor = Visitor.new(name: 'Alfred')
```
This will create a Visitor named Alfred with an empty loaned book list. By creating this user we are also loading the Library and all the books it contains

- As a Library we have the functionality of adding new books to our list
```
newLibrary.add_book('Harry Potter', 'JK Rowling')
```
This will create a new book with the tittle 'Harry Potter', and the author 'JK Rowling' and will add it to our YAML file with the status available and ready to be checked out by our visitors

-To search for a specific book, we are able to find them through their title (this can be done through the Library or through the Visitor)
```
newVisitor.find_by_title('Harry Potter')
```
This will retrieve the wanted book, stating the author and if it is available to be checked out

- We can also search by author (available for Library and Visitor as well)
```
newLibrary.find_by_author('JK Rowling')
```
This will display all the books in the list written by this author

- We are able to check out books and loan them for a month (function available for Library and Visitor)
```
newVisitor.check_out('Harry Potter')
```
After this you will receive a confirmation of the check out. The book will change it's status to unavailable and a return date will be automatically set for 1 month after the check out date

- When the Visitors have finished reading their books they are able to check them in
```
newVisitor.check_in('Harry Potter')
```
The book will be returned, changing it's status to available

- The visitor can also see all the books that he/she has checked out and see all the return dates
```
newVisitor.checked_out_books
```

- The library can see a list of all the checked out books that are overdue in their return date
```
newLibrary.

