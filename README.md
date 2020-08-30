# Library Challenge

## The Code

Our code is about creating an app for libraries. The app can be used by both librarians and users to check books in and out and check availability.

## Dependencies

Ruby 2.7.1 (Gemfile)


## Setup 

## Instructions

The data in this application is stored in a YML file. To modify the data in this file, start irb by typing 'irb' in your terminal. 

### To edit 
Enter: collection[0][:available] = false 
Result: false

### To store
Enter:  File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml } 
Result: YMl file is stored with the changes

### To search

Enter: collection.detect { |obj| obj[:item][:title] == "Dolly parton"  }
Result: A hash containing the item if it is found


## Acknowledgments

N/A

### User stories

As a librarian
I would like to see  if the ‘yaml’  file exists
So that I can search for an author

As a librarian
I would like to see a list of books
So that I can see if all books are available

As a visitor
I would like to see a list of books
So that I can see if the  title  i want is available

As a visitor
I would like to see the return date on my receipt
So I can return the book with a month 
