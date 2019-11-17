# Library challenge
## The code
A library needs to be able to keep track of it's books.
The program simulates interactions between the library and it's visitors.

### Dependencies
Ruby - A dynamic, open source programming language with a focus on simplicity and productivity. We have used ruby version 2.3.1.
RSpec- for testing our code (TDD). We have used RSpec version 3.9:

### Setup
For this to run you will need to:

Open Terminal app
Load pry or irb

```Load “lib/visitor.rb”

To set the stage we need to create a library and an visitor:
library = Library.new
visitor = Visitor.new

The librarian can now use the following commands

library.list_books
library.search(title)
library.checkout(title)

The visitor can use the following commands

visitor.list_books
visitor.return_book(title)
visistor.borrowed_books
```

### Acknowledgements
For creating this we have used:

VS Code - Visual Studio Code is a code editor redefined and optimized for building and debugging modern web and cloud applications.

Ruby - A dynamic, open source programming language with a focus on simplicity and productivity. We have used ruby version 2.3.7.

GitHub - GitHub is an American company that provides hosting for software development version control using Git. (Owned by Microsoft)

We have also used this sites to gather information:
Stackoverflow
Relish
Ruby Gems

### Updates/Improvements plans
Functionality to be added in future versions:

Adding books to the existing stack
Reminder for the visitor when time to return the book is nearing it's end
Multi-book borrowing for the visitor

#### Licenced under MIT

MIT information