## Library Challenge
### Week 1 Ruby challenge

Introduction
-------
The code creates a Library class that contains a list of books read from an (.yml) file. The Library includes functions to add new books, checkout and return books.

Instructions
-------
* Start irb
* create a new library, add the library name as argument:
```
 library1 = Library.new('library_name')
 ```
 this will create the file _library_name_data.yml_ in the main folder. And will initiate the library with five basic books.
* * The library books can be listed any time using the command:
```
puts library1.books
```
the result is array is an array of books, where each book is a hash that contains the book ID, title, author. In addition information about if it is available (available), the name of person whom checked it out (person) and the date it should be returned (return_date).
* create a new person, add name (string) and personnummer (integer) as arguments:
```
person1 = Person.new(name, personnummer)
```
the person will have a name, a personnummer and the list of books borrowed form a library. When a new person is created the books are an empty array.
* The person books can be listed any time using the command:
```
puts person1.books
```
the list shows the books titles, authors and return dates.
* A person can check the list of available books in library using:
```
puts library1.books_available
````
this will lest the books available only
* A person can check out a book from library by calling the Library method `.checkout` and passing argument of book ID (integer) and person (object) borrowing the book:
```
library1.checkout(id, person)
```
this will set a return date of 30 days from today, and then update the books in the library and the person objects.
* A person can return a book to library in similar method to checkout:
```
library1.return(id, person)
```
this will update both library and person objects.
* A person can check the return date of unavailable book by ID using the method `.return_date`
```
library1.return_date(id)
```
* A librarian can add books to the library collection using the method `.add_book` by passing the arguments of the new book name (string) and author (string)
```
library1.add_book(boo_name, book_author)
```
this will automatically create and ID for the book and add it to the collection and write it to the yml file.
* Error messages show in cases where a person try return an already returned book, or checkout an unavailable book, etc...
* Please note that the second book in the initial books (ID = 2) is unavailable for test purposes.
