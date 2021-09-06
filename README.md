## Library Challenge
### Week 1 Ruby challenge

Team: August and Max   

Due date: Monday 6/9

### The Code
Our code simulates a library through the use of two Ruby classes. One class is the library itself, and the other is a person who wants to borrow books at the library. The library catalogue is maintained in a YAML data file.

The requirements were:
_“We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. The library needs to store these books in a file where we can easily check if a book is available or not. The library also needs the visitors to check out books after finding the title they want. Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book.”_

Which led us to the following __user stories__:

As a library
in order to help people loan books
I want to display a list of available books.

As a library
in order to allow people to loan books
I want to allow them to check out available books

As a library
in order to help people loan the books they want
I want to inform them when unavailable books are due back

As a library 
in order to not checkout books to people who hadn't returned their books on time
I want to check their bookshelf

As a library
in order to keep people interested in my collection
I want to be able to add new titles to my collection

As a person
in order to read books 
I would like to check them out

As a person
in order to get the most out of my library
I want to search for all books by author

### Dependencies
Rspec for testing, Pry and Pry-byebug for debugging. Coveralls for magic...

### Setup
You can run `git clone https://github.com/AugustEnhager/library-challenge.git` in your terminal to download a copy of this repo (provided you have git installed).

Then `cd` into your new `library-challenge` directory.

If you don't have `pry`, `pry-byebug`, `rspec`, `coveralls` installed you may need to run `bundle install` (or equivalent if you are using something other than Bundler).

Feel free to run `rspec` to see the output of our tests in your terminal.

### Instructions
This programme is a prototype, as such it lacks a visual layer. The way to run it is through `irb` in your terminal. Make sure you are still in the `library-challenge` directory and run `irb`. Now we can load in our classes:
```ruby
> load('./lib/person.rb')
 => true 
```
The class `Person` requires the `Library` class, so no need to in any other file.

First thing first, we want to instantiate a person, with a name as follows:

```ruby
> bob = Person.new(name: 'Bob')
 => #<Person:0x00007fc6470d3e40 @bookshelf=[], @name="Bob">
```
Note that Bob has an empty bookshelf. Let's have Bob checkout a book:
```ruby
> bob.checkout("Pippi Långstrump")
/Users/max/craftAcademy/library-challenge/lib/person.rb:11:in `checkout': wrong number of arguments (given 1, expected 2) (ArgumentError)
```
Oh no! Bob was unable to check out a book, because he didn't instatiate a library (as you do)! Let's first assign it to the variable `library`:
```ruby
> library = Library.new
 => 
#<Library:0x00007fc646909e80
```
And go back to Bob checking out his book:
```ruby
 > bob.checkout("Pippi Långstrump", library)
 => 
{:status=>true,
 :message=>"You've checked out Pippi Långstrump",
 :date=>#<Date: 2021-09-06 ((2459464j,0s,0n),+0s,2299161j)>,
 :return_date=>#<Date: 2021-10-06 ((2459494j,0s,0n),+0s,2299161j)>} 
```
And he is all set! Let's look at his bookshelf:
```ruby
bob.bookshelf
 => 
[{:book=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"},
  :available=>false,
  :return_date=>#<Date: 2021-10-06 ((2459494j,0s,0n),+0s,2299161j)>}] 
```

### Acknowledgements
We stole guidance from the `atm-challenge-2021` repo we worked on during the past week.

### Updates / Improvements
- Format the return dates using `Date.strftime()`
- Format the checkout to not include availability on the bookshelf
- Change the return for the .available_books method for the Person class to only return author and title
- Reach: check for duplicates when Library adds titles to collection. 

### License
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.