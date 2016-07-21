#Library Challenge
##Week 1 Ruby challenge



###User stories implemented so far:

```
As a librarian
In order to have good books to offer to the public
I would like to be able to have a collection of books stored in a file
```

* How do I check this functionality in irb?

```
$ irb
2.2.3 :001 > require './lib/library.rb'
 => true 
2.2.3 :002 > require './lib/person.rb'
 => true 
2.2.3 :003 > lib = Library.new
 => #<Library:0x007f8948b15bb0 @books=[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]> 
```

Next thing we want to do:

```
As a librarian
In order to have good books to offer to the public
I would like to be able to allow individuals to check out a book
```

* How to check for this?

```
$ irb
2.2.3 :004 > per = Person.new
 => #<Person:0x007f8948b05850 @list=[]> 
2.2.3 :005 > checkout = lib.book_checkout("Alfons och soldatpappan", "Gunilla Bergström")
 => {:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :message=>"item booked successfully", :return_date=>"21/08/16"} 
```

After checking out a book we receive a message containing the return date set to 1 month after booking the item.

```
As a librarian
In order to make the books available to many individuals
I would like to set a return date on every check out
and I would like that date to be 1 month from checkout date
```

* The method set_return_date in Library class returns a value in Date format DD/MM/YY on every check out message as shown in the example above.
What comes after is explained in comments in between the irb commands.

```
$ irb

#IF WE TRY TO CHECK OUT THE SAME BOOK TWICE WE GET AN ERROR MESSAGE

2.2.3 :007 > checkout2 = lib.book_checkout("Alfons och soldatpappan", "Gunilla Bergström")
RuntimeError: This book is not available

#AFTER CHECKING OUT A BOOK WE STORE IT IN A LIST OF BOOKED ITEMS

2.2.3 :008 > per.add_to_list(checkout)
 => [{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :return_date=>"21/08/16"}] 

#IF WE ADD A SECOND ITEM TO THE LIST AFTER CHECKING OUT THE OUTPUT OF "list" WILL CHANGE REPORTING BOTH ITEMS

2.2.3 :009 > checkout3 = lib.book_checkout("Skratta lagom! Sa pappa Åberg", "Gunilla Bergström")
 => {:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström", :message=>"item booked successfully", :return_date=>"21/08/16"} 
2.2.3 :010 > per.add_to_list(checkout3)
 => [{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :return_date=>"21/08/16"}, {:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström", :return_date=>"21/08/16"}] 
2.2.3 :016 > per.list
 => [{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :return_date=>"21/08/16"}, {:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström", :return_date=>"21/08/16"}] 
```

* Lastly, we want to check a final scenario:

```
As an individual
In order to get my hands on a good book
I would like to see a list of books currently available in the library
with information about the title and author
```

```
$ irb
2.2.3 :017 > lib.available_books
 => [{:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}] 
```
