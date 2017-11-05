## Library Challenge
### Week 1 Ruby challenge

------
## Library Challenge submission

* A record of available books is made available by the Library
* A person can borrow and return books
* A person knows when the book is to be returned
* If a book is not available, a person is notified

* The program runs from irb but does not pass certain tests, seems like the instance doubles are not correctly formatted
```
spec/library_spec:rb:23, 30, 35 tests are failing
```
# irb commands

```
library.record_available_books

Alfons och soldatpappan, Gunilla Bergström
Skratta lagom! Sa pappa Åberg, Gunilla Bergström
Pippi Långstrump, Astrid Lindgren
Pippi Långstrump går ombord, Astrid Lindgren

library.set_return_date
 => sets expected_date one month from borrow

library.select_books_to_borrow("Alfons och soldatpappan", lisa)
 => "Alfons och soldatpappan has been borrowed and is due 05/12/17"

 library.select_books_to_return("Alfons och soldatpappan", lisa)
 => "Alfons och soldatpappan has been returned"

 user.add_book("Pippi Långstrump")
 => ["Pippi Långstrump"]

 lisa.return_book("Pippi Långstrump")
 => "Pippi Långstrump"

```


##### The Library program is based on the following user stories:

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
