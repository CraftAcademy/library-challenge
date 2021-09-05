## Library Challenge

### Week 1 Ruby challenge

## User stories

> “We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book.”

Breaking down the user stories:

As a librarian
In order to check available books
I want a function to call available books
(library.available_books)

As a visitor
In order to check available books
I want a function to call available books

#### Based on the story above I exctracted these functions while writing the application:

### The Visitor needs to be able to access the following

- List of available books in library, shows title and author
- List of books currently in possesion, and the return dates
- Able to checkout books

```
$irb
>load 'lib/visitor.rb'


```

### The Library needs to have these functions

- List of all books showing all data and return dates
- List of available books in library, shows title and author
- To store the data of available and unavailable books

```
$irb
>load 'lib/library.rb'
>libarary = Library.new
>libarary.collection



```

## Instructions

I can create a new visitor by typing:

```
> visitor = Visitor.new
```

As a visitor I can check available books by typing:

```
> visitor.visitor_available_books
```

As a visitor I can checkout an available book by typing:

```
> visitor.checkout_book('title')
```

## Acknowledgements:

We got inspiration from the Craft Academy coaches and course room. Big special thanks to our classmates for letting us bounce with ideas. Check below for links we used along during the duration of this project.

[Pry Help](https://github.com/pry/pry#commands)

[Tutorialspoint](https://www.tutorialspoint.com/ruby/index.htm)

[RSpec: Built in matchers](https://relishapp.com/rspec/rspec-expectations/v/3-4/docs/built-in-matchers/)

## License:

MIT-license
