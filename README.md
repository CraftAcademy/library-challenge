# The Library challenge
-------
Craft Academy weekend challenge number 1 is about creating a library and user for the library.

## Getting Started
-------
Prerequisites
You'll need to install

* *Ruby*

## Usage
-------
Start up `irb` in command line  
load up the program `load './lib/person.rb'`
next you will need to create a user, library, load the library with books and create a library list for the user.  
```
person = Person.new('name')
library = Library.new
library.load_yaml
list = library.book_list
```
The Person class takes one parameter, the name of the user  
library class takes no parameters  
If you want to use your own library list, give `library.load_yaml` one parameter with the location of your book list.  

With the Person class you can use these methods  
```
1. list_all_books(library, list)
2. list_available_books(library, list)
3. list_by_title(library, list, title)
4. list_by_author(library, list, author)
5. books_on_loan(library, list)
6. borrow_book(library, list, title)
7. return_book(library, list, title)
```

With the Library class you can use these methods  
```
1. load_yaml(file)
2. write_to_yaml(list, file)
3. books_available(list)
4. books_out(list)
5. search_by_author(list, author)
6. search_by_title(list, author)
7. list_books(list)
8. edit_list(list, title, new_title)
9. edit_author(list, title, new_author)
10. add_book(title, author)
11. delete_book(list, title)
```
Methods load_yaml and write_to_yaml have a default file, so you dont need to add those parameter to the methods unless you want your own list of books. The list needs to be in the format of YAML file and entry for every book should be like this.  
```
- :item:
    :title: Title of book
    :author: Magnus Thor
  :available: true
  :return_date:
  :loanee:
```
-------

## Author
Magnús Þór Ársælsson
--------
