## Library Challenge
### Week 1 Ruby challenge

#### Instructions

This program allows for searching a database of books by title and by author. To checkout a book one needs to create a "Borrower". When checking out a book the borrower is given a unique ID and that is stored in a tracker database along with which book has been borrowed, and when it should be returned. If the borrower tries to borrow a book again without having returned the book within the required time interval, that borrower will no longer be able to borrow a book until he returns it. The tracker and book databases are stored in separete yaml-files.

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
The books database will be updated to reflect that the book is no longer available, and the same book will also be added to a borrowed_books list in the borrower instance. The book has to be returned within one month.

If one closes down the session and starts it anew after having borrowed books with a certain borrower one has to recreate that borrower for continuity. The library class will load up the tracker and store it in a "borrower_list". Recreating the instance of the borrower has not yet been automated so for now do the following:

```
library = Library.new
library.borrower_list => [{:name=>"Robin", :id=>568760, :status=>true, :borrowed_books=>[{:title=>"Pippi Långstrump", :return_date=>"18-10-02"}, {:title=>"Alfons och soldatpappan", :return_date=>"18-10-02"}]}]
robin = Borrower.new("Robin")
robin.id = 568760
robin.status = true
robin.borrowed_books = [{:title=>"Pippi Långstrump", :return_date=>"18-10-02"}, {:title=>"Alfons och soldatpappan", :return_date=>"18-10-02"}]}]
```

One can now start to borrow new books and those will be appended to the borrower_list in the library instance and in the database (yaml-files)

Things to add later: Return function and automatic loading of borrower instances in the borrower list.

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
