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

## Client's task
*“We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book.”*

## User Stories
<ul>
  <li>As a Visitor</li>
  <li>to see what books that are availabe</li>
  <li>i want a list of the books</li>
</ul>
<br>
<ul>
<li>(Visitor = class?)</li>
<li>(availabe = method?)</li>
<li>(book_list = class? YAML?)</li>
</ul>
<br>
<ul>
<li>As a Visitor</li>
<li>To know when i should return my books</li>
<li>I want to get a receipt of what books and when</li>
</ul>
<br>
<ul>
<li>(receipt = method?)</li>
<li>(return = method?)</li>
</ul>
<br>
<ul>
<li>As a Visitor</li>
<li>to be able to return my books</li>
<li>i need to posses the books</li>
</ul>
<br>
<ul>
<li>(posses = method?)</li>
</ul>
<br>
<ul>
<li>As the Library</li>
<li>to see what books we have</li>
<li>i want a list of all the books</li>
</ul>
<br>
<ul>
<li>(Library = Class?)</li>
</ul>
<br>
<ul>
<li>As the Library</li>
<li>To be able to lend a book</li>
<li>The book need to be available</li>
</ul>
<br>
<ul>
<li>(lend = method?)</li>
</ul>
<br>


# User Stories
## 1
As a **Visitor**  
to see what **book**s I can borrow  
I want to see a list of **avalible books**

*Visitor - class  
book - object  
avalible_books - hash*  

## 2
As a Visitor  
to know when to return a book  
I want to be able to checkout the **return date**

*return_date - Date object*  

## 3
As a Librarian 
to see what books we have and what are lended  
I want to see a **status (avalible, borrowed)** on each book  

*status - symbol :avalible / :borrowed*  

## 4
As a Librarian  
to accsess the **library** database  
I want to have it in a separate file  

*library - hash*  

## 5 (not reqired)
As a Librarian  
to manage the library  
I want to be able to **add and remove books** from database  

*add_book - method  
remove_book - method*  

## 6
As a Librarian  
to manage library  
I want return date to be automatically installed to the 30 calendar days after it's been borrowed 