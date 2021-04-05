# User Stories

“We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book.”


As a library 

To show our users a list of books

We want a book list with the title, author and availiabilty details.

---
As a library 

For our users to check out books

We want an app to check out books with required return date

---
As a library 

To keep track of our books

We want a status of books overdue.

---
As a visitor 

To be able to checkout books

I want an app to checkout a book. 

---
As a visitor 

To be able to return books

I want to know when to return the book 

***

# How to use this application

1. Pull repo from Github. 
2. Open file in your IDE
3. Open your terminal in your IDE type: bundle and hit enter. 
4. Type: load './lib/library.rb' 
5. Type: library = Library.new 
6. Type: user = Visitor.new(name: 'user')
7. To search for books: type: library.book_search(title)
8. To loan a book: type: library.checkout(title,user)
9. To see list of library books and status type: library
10. To see list of books user has loaned type: user

---

# Updates / Improvements

- To be able to see who has loaned the book in the library list 
- Return method for loaned books
- Able to extend books loaned



# Ackowlegments 

- https://ruby-doc.org/stdlib-1.8.6/libdoc/yaml/rdoc/index.html
- https://github.com/LucasKnudsen/library-challenge used for support on IRB output from YAML file 'write'. 


# License 

- MIT License