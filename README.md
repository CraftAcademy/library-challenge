## Library Challenge
### Week 1 Ruby challenge

#### Instructions

Create a library:
```
library = Library.new
```
This loads up the datebase which can be accessed via the newly created library object. Use the search function to find books of your liking. Search takes three arguments: 
```
library.search(search_string, title/author, available)
```
The second argument will default to title and the third argument will default to all titles, regardless if they are in or not. Setting this parameter to true will only return searches that are available in the library.

To list all available titles directly, simply type:
```
library.list_available_books
```
In order to checkout a book one has to create a user of class Borrower:
```
borrower = Borrower(name)
```
The name has to be provided upon instantiation. 

Now checkout a title by passing in the title name and the borrower object:
```
library.checkout(title, borrower)
```
The books database will be updated to reflect that the book is no longer available, and the same book will also be added to a borrowed_books hash in the borrower instance. The book has to be returned within one month.

#### The following user stories were used to create this program:
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
```
As an individual 
In order to see what books are in the library
I would like to be able to search the library based on title name and author
```
