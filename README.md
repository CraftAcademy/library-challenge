# **Library simulator**
-------
This is a simple Library simulator. It allows users to
* view list of available books in the library, with info on title & author
* check out books
* view a list of books they currently have in their possession, with return dates
* query when books are meant to be returned

## Tech stack
-------
Program:
* Ruby
* Yaml for data (books available)

Unit testing the code:
* Rspec 

## How to install & use
-------
1. Download the app folder
2. Open the app folder in your terminal / CLI
3. Run `bundle install` to install all required Ruby gems
4. Enter irb and `load lib/library.rb` to test. Examples commands:
    * Create a new instance of Library: `library = Library.new`
    * Display books in library: `library.display_books`

        ** NOTE: for full list of available methods, open the `lib` folder in the main folder, then open each individual class file to view methods available