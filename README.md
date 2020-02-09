


# Library Challenge
Code pairing: *Kayla Woodbury*, *Anish Kanswal*

## Code overview
This software creates a digital library using Ruby and RSpec testing.The goal is to simulate a library where the following user stories are met:

* As a librarian or visitor, in order to review the entire library catalog, I want to be able to see a list of all library books, their title, author and availability.

* As a  visitor or librarian, in order to  find a book, I want to be able to search the library's catalog for a book by title or author.

* As a visitor, in order to checkout a book, I want the ability to check out a book.

* As a visitor, in order to checkout a book, I want to receive a message if the checkout was successful with the return date specified.

* As a visitor, in order to checkout a book, I want to receive a message if the checkout was unsuccessful because book is unavailable.

* As a librarian, in order to have an accurate catalog, I want books that are checked out to have their availability status updated in the library's catalog.

* As a librarian, in order to have an accurate catalog, I want books that are checked out to have the return date updated in the library's catalog.


#### Prompt these User Stories are responding to:
"We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book."

## Dependencies

* Ruby version 2.6.3
* Gems: Rspec, Pry, Pry-ByeBug, Rake, Coveralls, Rubocop
* Yaml file with list of books


## Setup
To access this code visit this [GitHub](https://github.com/Anish2504/library-challenge) repo and complete the following steps:

1. Fork the repo and clone it to your local computer
2. Have the Ruby and Gem bundler installed
3. Utilize IRB to run program

## Instructions
Instructions for running in IRB.

**Activate virtual library** | Connects to the YAML file to intialize the library catalog. 

        library = Library.new


**Veiw entire library book list** | Displays array of all books including title, author, availability, and if appicable, the return date.

        library.catalog


**Search for a specific book** | Looks for books either by title or author, does not need the full title/name for search to run
        
        library.title_search('*enter title here*')
        library.author_search('*enter author here*') 


**Check out book** | Checks out book by entering the full book title, if book is available the user will see message that checkout was successful with the return date and the library's catalog will be updated; if book is unavailable user will see message that checkout was unsuccessful

        library.checkout('*enter full book title*')


## Acknowledgements
Material from [Craft Academy](learn.craftacademy.co) <br>
[Ruby Documentation](rubymonstas.org) <br>
[Rspec Program](rspec.info) <br>
Material from the [Craftoverflow](https://github.com/CraftAcademy/CraftOverflow) repo on GitHub <br>
[Ruby Date Cheatsheet](https://www.shortcutfoo.com/app/dojos/ruby-date-format-strftime/cheatsheet)

## Updates/Improvement Plans
* Adding personal vistor account with login
* Being able to add and remove books from catalog
* Formatting how book info is displayed

## License
MIT License <br><br><br>

---

## Notes from Coaches

----
##### I'm hoping to see that:
* You can take a problem set and write a well tested implementation on your own.
* You understand how to define Ruby Classes and work with objects.
* You understand how classes can interact with each other.
* You know how to make use of arrays, hashes, and associated methods to create dynamic lists.
* You know how to write specs and use them as a blueprint in your development.
* I can track your work by following you commit history - so please commit as soon you are done with a feature or when you have made a test pass.

##### In your Pull Request, I'm hoping to see:
* That you are testing the right thing in the right spec file.
* That all tests passing - green is good!
* High test coverage (above 95% is accepted)
* The code is easy to follow: every class has a clear responsibility, methods are short, code is nicely formatted, etc.
* The `README.md` includes information on how to use your solution with command examples in `irb`. (Feel free to remove this text)