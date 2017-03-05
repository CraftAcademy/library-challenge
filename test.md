#Testing the library challenge in irb

2.3.1 :004 > load './lib/library.rb'
 => true
2.3.1 :005 > test = Library.new
 => #<Library:0x007f9c3e05e9c0 @bookrack=[{:item=>{:title=>"Purpose Driven Life", :author=>"Rick Warren"}, :available=>true, :return_date=>nil, :due_date=>nil}, {:item=>{:title=>"The Alchemist", :author=>"Paulo Coelho"}, :available=>false, :return_date=>"2017-04-03"}, {:item=>{:title=>"Eat Pray Love", :author=>"Elizabeth Gilbert"}, :available=>false, :return_date=>"2017-03-25"}, {:item=>{:title=>"Gulliver's Travels", :author=>"Jonathan Swift"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Roadless Travelled", :author=>"M. Scott Peck Md"}, :available=>true, :return_date=>nil}]>

##View available books in the library
2.3.1 :006 > test.available_books
 => [{:item=>{:title=>"Purpose Driven Life", :author=>"Rick Warren"}, :available=>true, :return_date=>nil, :due_date=>nil}, {:item=>{:title=>"Gulliver's Travels", :author=>"Jonathan Swift"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Roadless Travelled", :author=>"M. Scott Peck Md"}, :available=>true, :return_date=>nil}]

##View all books in the library
2.3.1 :007 > test.view_all_books
 => [{:item=>{:title=>"Purpose Driven Life", :author=>"Rick Warren"}, :available=>true, :return_date=>nil, :due_date=>nil}, {:item=>{:title=>"The Alchemist", :author=>"Paulo Coelho"}, :available=>false, :return_date=>"2017-04-03"}, {:item=>{:title=>"Eat Pray Love", :author=>"Elizabeth Gilbert"}, :available=>false, :return_date=>"2017-03-25"}, {:item=>{:title=>"Gulliver's Travels", :author=>"Jonathan Swift"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Roadless Travelled", :author=>"M. Scott Peck Md"}, :available=>true, :return_date=>nil}]

##Checkout book with index 0 to patron (yml file updated)
2.3.1 :008 > test.check_book_availability(0)
 => {:item=>{:title=>"Purpose Driven Life", :author=>"Rick Warren"}, :available=>false, :return_date=>nil, :due_date=>#<Date: 2017-04-03 ((2457847j,0s,0n),+0s,2299161j)>}

##Checkout book with index 3 (yml file updated)
2.3.1 :011 > test.check_book_availability(3)
 => {:item=>{:title=>"Gulliver's Travels", :author=>"Jonathan Swift"}, :available=>false, :return_date=>nil, :due_date=>#<Date: 2017-04-03 ((2457847j,0s,0n),+0s,2299161j)>}

##Returning book to library (yml file updated)
2.3.1 :012 > test.receive_book_returned_by_patron(0)
 => 584
