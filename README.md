**1-USER STORY for keeper!**
Aser a library keeper 
in order to track books keeper should have a books list
book list = YAML file( Book list for Keeper)
# we can use keeper as a attribute

**2-USER STORY for keeper!**
Aser a library keeper 
in order to see availability of Books in library
keeper should have a way to check them in a specific way.
# methhode for availabilty

**3-USER STORY for keeper!**
As a keeper 
In order to successfully rent out books
The keeper  needs to check availability before doing the check out

**4-USER STORY for Customer!**
As a customer
In order to rent a book customer should be able to check available list of books
They need to be able to check out a book

**5-USER STORY for Customer!**
As a visitor
In order to receive a book
They need to store the book

**6-USER STORY for Customer!**
As a visitor
The keeper needs to know when the return date is
At book checkout it displays the date of return

## License
MIT License 

## Dependencies
- Ruby
- RSpec

## Acknowlegments
- Course material from [Craft Academy]
- [Save data to file from StackoOverflow](https://stackoverflow.com/a/2777863)
- [Convert Array or Hash object to YAML format](https://stackoverflow.com/a/17576810)
- Sanne Lindholm (https://github.com/salindholm/library-challenge)
- Lucas 

## Instructions
➜  library-challenge git:(master) ✗ irb 
irb(main):001:0> load './lib/keeper.rb'
=> true
irb(main):002:0> load './lib/customer.rb'
=> true
irb(main):003:0> keeper = Keeper.new
irb(main):004:0> keeper.search(title: 'Mathew')
=> [{:publication=>{:title=>"Mathew", :author=>"Apostle-Mathew"}, :available=>true, :return_date=>nil}]
irb(main):005:0> keeper.search(author: 'Moses')
=> [{:publication=>{:title=>"Genesis", :author=>"Moses"}, :available=>true, :return_date=>nil}]
irb(main):006:0> keeper.search(title: 'Mathew', author: 'Apostle-Mathew')
=> [{:publication=>{:title=>"Mathew", :author=>"Apostle-Mathew"}, :available=>true, :return_date=>nil}]
irb(main):007:0> 

