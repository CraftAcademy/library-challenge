## Library Challenge
### Week 1 Ruby challenge

Requirements
-------

We are approached by a newly built library. They need an app to keep track of all their books. 

 *“We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book.”*

From the description above, I am able to extract the following user stories:

 As a library visitor/employee  
 In order to check if a book is available  
 I want to have a list of books with availability, title and author.


 As a library employee  
 In order to check a book availability  
 I want to store these books in a file

 As a library employee  
 In order to keep track of the books availability  
 I want to store information about who checked out the book

 As a library employee  
 In order to search of a book in my list  
 I want to be able to make a search by title

 As a library employee  
 In order to keep the books available to every visitor  
 I want to give 1 month period for lending a book

# The code
The library_challenge is a simple ruby based project, 
In order to produce good quality code,
we work in a test driven way and unit test this coade According to the requirements and logical needs set by the course material we need to have a Library, so we write the code based on Library  class to complete the whole project.
# Dependencies
Game framework we used Rspec for unit test

# Setup
We’ll be write our application using Test Driven Development(RSpec),
In order to be able to use it we need to install it.
There are two ways to install libraries (gems). 
A direct install from your terminal(gem install rspec) .$ gem install bundler or by adding a gem as a dependency to your application using Bundler ,
you just add a gem to a specific file named Gemfile. And run bundle install again. The next step is to initialize RSpec and configure it for our needs. 
.$ rspec --init Edit the .rspec file and add --format documentation to see a more verbose rspec output.
 .rspec file needs to look like this. --format documentation --color --require spec_helper
 # Acknowledgements
 WE Miyeaier and Shagufta did pairing programming on this project. we are thankful to our coach for his assitance and appreciate our fellow students help. 
# Improvement plans
-------
In this project we have only the write the basic tests and the project is without any user interface. our future plan is to write many more test for different usecase stories.