##Library Challenge
###Week 1 Ruby challenge

Instructions
-------

To check the functionalities of the library do the following steps:



* Open IRB in your terminal and type:

```
irb(main):001:0> require './lib/library.rb'
=> true
irb(main):002:0> require './lib/person.rb'
=> true

irb(main):003:0> lib = Library.new
=> #<Library:0x007fef9185b6b8 @collection=[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"IT", :author=>"Stephen King"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"2016-05-25"}, {:item=>{:title=>"Osynligt
med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]>
irb(main):004:0> person = Person.new
=> #<Person:0x007fef918404d0 @booklist=[]>
irb(main):005:0> my_book = lib.check_out('IT', 'Stephen King')
=> {:title=>"IT", :author=>"Stephen King", :message=>"Item successfully booked.", :return_date=>"02/2018"}
irb(main):006:0> person.add_to_list(my_book)
=> [{:title=>"IT", :author=>"Stephen King", :return_date=>"02/2018"}]
```

* To check if library thorws error when trying to book an unavailable book do the following:
```
irb(main):007:0> irb(main):007:0> my_book2 = lib.check_out('IT', 'Stephen King')
=> "This book is not available."

```

* To be sure the library throws an error if you search a book that is not in the catalogue

```
irb(main):008:0> my_book3 = lib.check_out('IT', 'Dante Alighieri')
=> "This book is not in our catalogue."

```
