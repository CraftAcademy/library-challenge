##Library Challenge

Instructions
-------
This is the Library challenge for week 01 in the Craft Academy programming course. The challenge simulate a library with a collection of books that allows visitor to see the list of books, search a specific book and lend it out. 

###User Stories
----

```
As a library
In order to keep control of books (title, author,available..)
I want to have a collection of the books
```

```
As a library
In order to see list of books available (title and author)
I want to see list of available books

```

```
As a library
In order to have see a specific book
I would like the visitor to be able to search for a specific book

```

```
As a library
In order to have good books to offer to the public
I would like to be able to allow individuals to check out a book

```

```
As a library
In order to get our book back
I want the return date to be one month after checkout and allow visitor to know when to return the book

```

###Running in irb
----

```
$ irb
> load 'lib/library.rb'
> library = Library.new
> library.collection
> library.books_available
> library.search('Pippi Långstrum')
> library.lend_out_book('Pippi Långstrum')
> library

```

###Built with
----
The project is built with Ruby as programming language.

###Authors
____
  * Albert Stjarne
  * Rhon Gabriel

###Acknowledgement
____
Thanks to the coaches for the support during the project