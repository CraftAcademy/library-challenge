# Alfreds Library Challenge

## Craft Academy Week 1

This is my solution to the Library Challenge.

### Gems Used

* rake
* rubocop
* rspec
* coveralls

### How to use the program

1. Open a ruby shell of your choice, such as irb.
2. Load the person.rb file. `load './lib/person.rb'`
3. Create a person and pass a name as an argument. `person = Person.new('Name')`
4. Create a library. `library = Library.new`
5. To see what books are available, type `library.booklist`
6. To check out a book, type `library.checkout('title', person)`
7. To see what books are in persons collection, type `person.books`
