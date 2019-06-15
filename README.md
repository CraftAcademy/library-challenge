# Challenge: Book tracking system backend for library applications

## Summary
This repository contains Ruby scripts and RSpec tests for tracking a collection of books in a hypothetical library system.  The backend system must modify the book inventory information appropriate to changes in 'state' of the books as members borrow and return the library books.  Book information is stored locally in a YAML file.  Static data about the books includes *title* and *author*.  Dynamic information about the books includes *borrowed status* and *due date*.  

## Table of Contents
1. Project Goals
2. Project Setup
* Prerequisites 
* Installation 
* Running tests
3. Contributions
4. Versioning
5. Authors
6. Acknowledgements

## 1. Project Goals
The requirements for a successful library backend are extracted from a statement from the client.

"We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book."

User stories can represent the *requirements* of the project as defined by the needs of *stakeholders* of the system expressed as desired *results*.  They follow a particular format for consistency and clarity.

For example,
```
As a (stakeholder),
In order to (requirement),
I want (result).
```

Using the client statement from above, the user stories for this project are as follows,

```
As a library member...

In order to learn of the available books in the library,
I want to access a list of the available books identified by title and author.

In order to borrow an available book,
I want to have the system let me initiate borrowing an available book from the list.

In order to search for a desired book,
I want to be able to search the available book titles by keyword. 
```

```
As a librarian...

In order to learn of the books in the library,
I want to access a list of all books identified by title and author.
```

```
As a library administrator...

In order to track the borrowed status of the books,
I want the system to have a complete inventory list of books *file* that tracks book borrowed status.

In order to permit a member to borrow a book of interest,
I want to have the system record that the book has been borrowed by that member.

In order to permit a member to borrow a book of interest,
I want to have the system calculate a due date one month from the borrow date, and record that date.

In order to inform a member of a book due date,
I want to have the system inform the member of the due date when the book is borrowed.
```



## 2. Project Setup

## 3. Testing
In IRB or Pry from the Root folder, begin by loading the Ruby files and creating instances of a library member, a librarian, and a library.

```
1. load 'lib/member.rb'
2. load 'lib/librarian.rb'
3. load 'lib/dewey.rb'
4. mem = Member.new(name: 'your_name')
5. librar = Librarian.new
6. lib = Dewey.new
```

The librarian can look at the status of the entire library collection at any time by running,
```1. librar.check_books(lib)```
The output is in ```@librarians_book_view```.  It is not parsed well, but you can take the time to check that it is identical to ```collection_original.yml```.

The library member can see a list of the available books 
```
1. mem.check_available_books(lib)
```
which is a subset of what the librarian can see.  It is important to note that I have added a ```:number:``` attribute for easier book identification, and a ```:member:``` attribute for the library to track who has borrowed the book, to each entry of the .yml file.  Books 2 and 5 are currently checked out, so the library member should only see books 1, 3, and 4.  The library member can also search the available books by title, which is a string based search that is case sensitive.
```
1. mem.search_titles(lib, 'search_term')
```

Finally, when the library member has decided to borrow a book from the library, it can be accomplished so long as the book is on the available books list.
```
1. mem.borrow(lib, mem, 1)
```
You can try to take out books that are not on the available book list by guessing at their book number.  See what happens...

As a library member continues to borrow books, the available book list will shrink accordingly, but the librarian will always be able to see all the books, as well as confirm that the ```:available```, ```:return_date```, and ```:member``` attributes continue to update.  One can also see the lists simultaneously by calling the library instance ```lib``` that contains both.

## 4. Versioning

## 5. Authors

## 6. Acknowledgements
Thank you to Craft Academy in Stockholm, Sweden for crafting this challenge.