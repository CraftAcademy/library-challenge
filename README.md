# Objective 
 
 > "We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book."
 
# Problem statement
The library needs a simple and flexible way of tracking the books in their posession, checking the availability status of books, modifying their stock and allowing it's visitors to check out books on their own.


# User stories

```
As a Library
In order to know how many books I have
I would like a list of all the books in my possession
```


* Create the YAML file (unique code for every book, name of who we give it) **done**
* Create Library Class **done**
* Create an instance variable books for Library class **done**
* Create a method to search the YAML file by title, the method returns all data **done**
* Create a method to search the YAML file by author, the method returns all data **done**

```
As a Library
In order to serve my visitors efficiently
I would like to check out books for my visitors.
```

* Create a method that checks out the book using the index number. It pushes in the "available" and "return_date" values in the YAML file. **done**
* Create a class double for Visitor class and add the function that pushes "borrowed_by" value into the YAML file. **done**


```
As a Library
In order to make new books accesible to public
I would like to be able to add new books to the system.
```

* Create a method to add new entries to the YAML file **done**


```
As a Visitor
In order to be able to choose
I would like to be able to search the list of books
```

* Create Visitor Class (attribute name) **done**
* Create a method to read the YAML file (no name access)**done**
* Create a method to search the YAML file by title (no name access)**done**
* Create a method to search the YAML file by author (no name access) **done** 

```
As a Visitor
In order not to wait in the line
I would like to be able to checkout a book by myself and know when to return it
```
* Create a method that lets a visitor checkout the book and prints a message with the return date **done** 










