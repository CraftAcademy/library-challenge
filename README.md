# Library program

## How to use the Library program

### Starting the program

The Library program has two classes, **Library** and **User**.

Start the Library program in IRB by requesting the Library file
```require './lib/library.rb'```

Create a new library
```your_library_name = Library.new```

Go to the menu
```your_library_name.menu```

### Navigating the menus

You may:
* Create an user
* List books in the library system (and check if they are available/unavailable)
* Search for a book with an author name
* Borrow any available books
* Show which books you have borrowed, and their return date
* Exit the menu

Navigate through the menu with the corresponding numbers.

**Create an user**
You enter a username and are now logged in.

**List books in the library system**
No need to log in.

**Search for a book with an author name**
No need to log in. User will get an message if there is no match.

**Borrow books**
The user will get an error message if it has not logged in.
The user will get an error message if it does not put in a number that corresponds to the listed books.
The user will get an error message if it's trying to borrow an unavailable book.

**Looking at the users borrowed books**
The user will get an error message if it has not logged in, or if has no borrowed books.
Otherwise the user will see the title of the book, and the return date.

**Exiting the menu**
Exits the menu, but is still in IRB.
