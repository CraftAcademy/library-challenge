## Library Challenge

### Week 1 Ruby challenge

## User stories

> “We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book.”

## Breaking down the user stories

- As a librarian
- In order to check all books in my library
- I want a function to call all books in my library

- As a librarian
- In order to check available books
- I want a function to call available books

- As a librarian
- In order to search for a specific book
- I want a function to search for specific book by entering a title

- As a visitor
- In order to check available books followed by title and author
- I want a function to show available books with title and author

- As a visitor
- In order to borrow a book the visitor needs to check the book out
- I want a function to make the visitor being able to check the book out

- As a visitor
- In order to see which date to return the book
- I want a function that will give me a receipt on my return due date

- ## Instructions

### Enter code below in the terminal to load the Library class.

```

$irb
>load 'lib/library.rb'

```

I can create a new library by typing:

```

> library = Library.new

```

I can see all books in the collection by typing:

```
> library.collection

```

As a librarian I can check available books by typing:

```

> library.available_books

```

Enter code below in the terminal to load the Visitor class.

```

$irb
>load 'lib/visitor.rb'

```

As a visitor I can checkout an available book by typing:

I can create a new visitor by typing:

```
> visitor = Visitor.new
```

As a visitor I can check available books by typing:

```
> visitor.visitor_available_books
```

```
> visitor.visitor_available_books
```

As a visitor I can checkout an available book and get a
return date by typing:

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
