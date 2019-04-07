# REQUIREMENTS AND USER STORIES

## Requirements
We are approached by a newly built library. They need an app to keep track of all their books. Luckily they have only received a handful of books so far and this is the perfect time to create a prototype application that will keep track of the books. They are telling us:

"We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book."

## User Stories
```
As a library,
in order to be able to keep track of what books we have in our possession,
we would like to have a database for all books in our possession
```
```
As a library,
in order to be able to check what books are currently available to checkout for a customer,
we would like to be able to search what books we have available and which ones are not available
````
```
As a library,
in order to be able to check when books are planned to be returned,
we would like to be able to search the return date for each book
```
```
As a customer,
in order to be be able to see what books are available to checkout,
I would like to be be able to see a LIST of what titles - and their authors - are available
```
```
As a customer,
in order to be be able to find books that are available to checkout,
I would like to be be able SEARCH the library database for titles and see whether they are available
```
```
As a customer,
in order to be be able to borrow a book,
I would like to be be able to checkout a book I selected and get a success message
```
```
As a library,
in order to keep track of what books are available and not,
we would like that when a book is checked-out by a customer, it is no longer available for others
```
```
As a library,
in order to keep track of when non-available books are planned to be returned,
we would like that when a book is checked-out by a customer, a correct return date of 30 days later is added to the database

```
As a customer,
in order to know when I should return the book I checked out,
I would like to get a message for which date I should return the book after check-out
```
```
As a library,
in order to keep track of what customer has cheked-out what books,
we would like so that when a book is checked-out by a customer, the customer is added to the database
```