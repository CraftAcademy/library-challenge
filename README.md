# library_challenge_2020
By Sara Lundqvist & Sebastian Niewiadomski

We first created a own repository that we forked and pushed up everyting to by merging.
Then we realized that we should have forked the repo from CraftAcademy, which we did and then continued working with the project.
To see old commits please visit https://github.com/Saralundkvist86/atm


## The code
Library_challenge_2020 application can load a register of books in the Library from YAML. The Library can then see Authour and Title of the books they got.
Visitors can checkout books and then get a returning date of 1 month from todays date.
Visitors can also see when unavailable books are going to be returned.


## Userstories
As a Library owner
I want to see a list of books 
So that i know what the Library has to offer

As a Library owner
I want to see a list of books (with author and title) available 
so that i know what books can be checked out

As a Visitor
i want to checkout a book for 1month of time
so that i know when to return it

As a visitor
I want to be able to return my book
So that I get rid of the returndate

As a Visitor
i want to see when unavailable books are planned to be returned
so that I know when it's available for me to checkout

## Dependencies
source 'https://rubygems.org'

ruby '2.7.0'

gem 'rake'
gem 'rspec'
gem 'pry'
gem 'pry-byebug'
gem 'coveralls', require: false
gem 'rubocop'


## Setup
-Library
$irb
>require 'yaml'
>load './lib/library.rb'

//see the whole catalogue
>catalogue

//create a new instance of Library class
>library1 = Library.new

//see list containing title & author
>library1.show_title_author 

###Acknowledge
Thanks to Odeane Croney who inspired us with coding and helping us out with IRB
https://github.com/Odeane/library-challenge.git

Thanks to Johan, Connor and Emiliano for helping us out with gem installation
