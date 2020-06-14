## Library Challenge
### Week 1 Ruby challenge

#### Acknowledgments

In order to do this, we used CraftAcademy course material, we used information from the YAML demo. We also looked at our senior's code for indication if we were on the right track. We mostly looked at :

https://github.com/emtalen/library-challenge
https://github.com/jysmys/library-challenge

#### User stories
As a User
When looking at the list of books
I want to see the title and the author

As a visitor
In order to checkout a book
I need to see if it's available

As a visitor
When checking out a book
I want to know when to return it

As a library
In order to see available books
I want to know their status

As a library
When a visitor checks out a book
I want an update in the database


--------------------------------------------------------

#### Commands in Terminal

Load irb
```
$ irb
```

Load the required files
```
$ load './lib/library.rb'
$ load './lib/visitor.rb'
```

Create a new library
```
$ lib = Library.new
```

Create a new visitor
```
$ user = Visitor.new
```

Show the collection of books with all information
```
$ lib.collection / user.collection
```

Check out a book
```
$ lib.book_checkout
```

Check in a book
```
$ lib.book_checkin
```

Show a list of books with only title and author
```
$ lib.book_list
```

Sort books by only those available
```
$ lib.availability
```

Sort books by only those not available
```
$ lib.not_available
```

Show visitor list of books in their possesion with return date
```
$ user.my_list
```