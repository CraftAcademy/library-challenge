# library-challenge

## Brief Description
Will Post Soon.

## Attention
Some of the should get messages written below might not match the ones exactly that you'll receive in irb or pry

## Getting Started
1. In terminal type irb or pry (Will need to install pry as gem first)
2. Load the files
* Type `load './lib/person.rb'`
* Should get: `=> true`
* Type `load './lib/library.rb'`
* Should get: `=> true`

## Become a Person
1. Make a new instance/copy of the Person class
* Type: `me = Person.new(name: 'Scott')`
* Should get: `=> #<Person:0x007fe16a0e4d38 @name="Bo", @my_books=[], @library=nil>`
2. Enter the library
* Type `library = me.enter_library`
* Should get: `=> #<Library:0x007fe16a89dcf0 @books=[{:item=>{:title=>"Diary of a Wimpy Kid", :author=>"Jeff Kinney"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Chamber of Secrets", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Hunger Games", :author=>"Suzanne Collins"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Lord Of The Rings", :author=>"J.R.R Tolkien"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Of Mice And Men", :author=>"John Steinbeck"}, :available=>true, :return_date=>nil}]> `

## How To Search
1. Run the following search command
* Type: `library.search(title: "The Hunger")`
* Should get: ` => [{:item=>{:title=>"The Hunger Games", :author=>"Suzanne Collins"}, :available=>true, :return_date=>nil}]`
2. Can be handy to search via available books
* Type: `library.search(available: true)`
* Should get: `=> [{:item=>{:title=>"Diary of a Wimpy Kid", :author=>"Jeff Kinney"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Chamber of Secrets", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Hunger Games", :author=>"Suzanne Collins"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Lord Of The Rings", :author=>"J.R.R Tolkien"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Of Mice And Men", :author=>"John Steinbeck"}, :available=>true, :return_date=>nil}] `
3. Can be more specific, search by title and author might be best
* Type: `library.search(title: 'The', author: 'J.R')`
* Should get: ` => [{:item=>{:title=>"The Lord Of The Rings", :author=>"J.R.R Tolkien"}, :available=>true, :return_date=>nil}]`
4. Forgot the book title? Search by author!
* Type: `library.search(author: 'Suzanne Collins')`
* Should get: ` => [{:item=>{:title=>"The Hunger Games", :author=>"Suzanne Collins"}, :available=>true, :return_date=>nil}] `

## How To Checkout
1. Run the following checkout command
* Type: `library.checkout("The Hunger Games", me)`
* Should get: `=> [{:item=>{:title=>"Diary of a Wimpy Kid", :author=>"Jeff Kinney"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Chamber of Secrets", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Hunger Games", :author=>"Suzanne Collins"}, :available=>false, :return_date=>"2017-12-06"}, {:item=>{:title=>"The Lord Of The Rings", :author=>"J.R.R Tolkien"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Of Mice And Men", :author=>"John Steinbeck"}, :available=>true, :return_date=>nil}]`
* Type `me.my_books`
* Should get: ` => [{:item=>{:title=>"The Hunger Games", :author=>"Suzanne Collins"}, :return_date=>"2017-12-06"}]`
2. Make sure to return the book before you checkout a new book!

## How to Return
1. Run the following return command
* Type: `library.return(me)`
* Should get: `=> {:item=>{:title=>"The Hunger Games", :author=>"Suzanne Collins"}, :return_date=>"2017-12-06"}`
2. You may now checkout another book and type the following to see the library's books status updated
* Type: `library.books`
* Should get: ` => [{:item=>{:title=>"Diary of a Wimpy Kid", :author=>"Jeff Kinney"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Chamber of Secrets", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Hunger Games", :author=>"Suzanne Collins"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Lord Of The Rings", :author=>"J.R.R Tolkien"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Of Mice And Men", :author=>"John Steinbeck"}, :available=>true, :return_date=>nil}] `
