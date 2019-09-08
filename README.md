# The Library challenge

## Dependencies
**Programming language:** Ruby  
**Testing framework:** [RSpec](https://rspec.info/) 

## Authors  
[Clarissa Liljander](https://github.com/clalil)  
[Miyesier Kaerman](https://github.com/miyeaier) 

## The code  
This program represents a library prototype application. As a visitor of the Library you may view all relevant information about the books such as title, author, availability and current due date. You may check out a book and receive its due date.  
 
## Setup  
To test this application you need to fork it to your own GitHub account and clone it to your local workspace. Once you have cloned the repository, you will be able to:  
* Retrive books from the library collection.
* Search for specific book titles as well as related book titles.
* Proceed to checkout with a book of your choice.
  
To get started, run IRB in your local workspace. Make sure to load the following files:  
```rb
load 'lib/library.rb'
``` 

## Instructions  
Once the files are loaded in IRB, get started by visiting your local Library:  
```rb
library = Library.new  
```
Look up available books:  
```rb
library.collection
```

Search for books with a title containing a subject/phrase
```rb   
library.search('Pippi')  #This method will return all books containing parts of your input string
```

Search for a specific book title to see if it's currently availble: 
```rb
library.pick('Pippi Långstrump') #This will return the book details with a title that matches your input string
```

Proceed to checkout with your book of choice and receive a return date:  
```rb 
library.checkout('Pippi Långstrump')  #The book title need to be a perfect match of the book you wish to check out
```

## Acknowledgement  
Thank you [CraftAcademy](https://craftacademy.se/) for giving us this challenge.  

## Updates/Improvements  
When time given, we plan to finalize our code.  
* At the moment, using the checkout method replaces all data inside of the data.yml file, instead of adding to it.  
* At the moment, the syntax for the instance double prevents creating an instance of the Library class when loading the file in IRB.  
* At the moment, there is currently only a Library class and an instance double for a Librarian class.

## User stories
```
As a Visitor  
In order to lend a book  
The Library needs to have books  

As a librarian  
In order to find a book to lend out    
I want to see the title and author of the book  

As a librarian  
In order to check if a book is available or not  
I need the books to be stored in a file that tells me if they are available or not  

As a librarian  
I need to know which day the visitor has to return the book  
So that I know when to send him/her a fine  

As a Visitor  
In order to check out a book  
I want to see the title and author of the book  

As a Visitor  
In order to know when to return a book    
I want to know the due date of the book  

```