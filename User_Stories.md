## Client's task
*“We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book.”*

# User Stories
## 1
As a **Visitor**  
to see what **book**s I can borrow  
I want to see a list of **avalible books**

*Visitor - class  
book - object  
avalible_books - hash*  

## 2
As a Visitor  
to know when to return a book  
I want to be able to checkout the **return date**

*return_date - Date object*  

## 3
As a **Librarian** 
to see what books we have and what are lended  
I want to see a **status (avalible, borrowed)** on each book  

*status - symbol :avalible / :borrowed*  

## 4
As a Librarian  
to accsess the **library** database  
I want to have it in a separate file  

*library - hash*  

## 5 (not reqired)
As a Librarian  
to manage the library  
I want to be able to **add and remove books** from database  

*add_book - method  
remove_book - method*  

## 6
As a Librarian  
to manage library  
I want return date to be automatically installed to the 30 calendar days after it's been borrowed 