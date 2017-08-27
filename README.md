# The Library challenge
-------
Craft Academys weekend challenge number 1 is about creating a library and user for the library.

## Getting Started
-------
Prerequisities
You'll need to install

* *Ruby*

## Usage
-------
Start up `irb` in command line  
load up the program `load './lib/person.rb'`
next you will need to create a user, library and load the library with books.  
```
person = Person.new('name')
library = Library.new
library.load_yaml
```
The Person class takes one parameter, the name of the user  
libray class takes no parameters  
If you want to use your own library list, give `library.load_yaml` one parameter with the location of your book list.  
