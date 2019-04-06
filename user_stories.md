# Requirements
We are approached by a newly built library. They need an app to keep track of all their books. Luckily they have only received a handful of books so far and this is the perfect time to create a prototype application that will keep track of the books. They are telling us:

"We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book."

##Identified Classes


##User Stories
```
As a library,
in order to be able to keep track of what books we have in our possession,
we would like to be have a database for all books in our possession
```
- Create Library class
- Create YAML database

```
As a library,
in order to be able to check what books are currently available to checkout for a customer,
we would like to be able to search what books we have available and which ones are not availble
````
- Create Person class instance double (to be able to search)
- Make "search" method for library, for all books in database - by returning title, author, availability

```
As a library,
in order to be able to check when books are planned to be returned,
we would like to be able to search the return date for each book
```
- Add "return date" to search method above..

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
- Create a Person (customer) class

```
As a customer,
in order to be be able to find books that are available to checkout,
I would like to be be able SEARCH the library database for titles - and/or the authors - and see whether they are available
```
- Add search method

```
As a customer,
in order to be be able to lend a book,
I would like to be be able to checkout a book I selected and get a success message
```
- Add "checkout" method
- Add condition to onle be able to checkout if book is available
- Add "success" message after sucessful checkout

```
As a library,
in order to keep track of what books are available and not,
we would like that when a book is checked-out by a customer, it is no longer available for others
```

- Set so that on checkout by Customer, the availability of the book is changed

```
As a library,
in order to keep track of when non-avaialble books are planned to be returned,
we would like that when a book is checked-out by a customer, a correct return date is added
```
- Set CONSTANT for standard "validity"/standard lending time
- Ensure that return date is added on checkout
- Ensure that return date = today + standard lending time

```
As a customer,
in order to know when I should return the book I checked out,
I would like to get a message for which date I should return the book after check-out
```
- Add return date to "success" message after checkout