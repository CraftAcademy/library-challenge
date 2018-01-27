# Library Challenge
This program builds a virtual library that allows users to search for books, check them out, and hold books in their own bookshelf. It is written using Ruby and checked with RSpec.

### Learning objectives
Taking a problem set and write a well tested implementation on your own.
Understanding how to define Ruby Classes and work with objects, and how it all interacts.
You know how to make use of arrays, hashes, and associated methods to create dynamic lists.
You know how to write specs and use them as a blueprint in your development.

### Usage

After downloading the repo, the Library Challenge can be run using IRB.

First, require and load the YML file.
``` $ irb(main):001:0> require 'yaml'
=> true

$ irb(main):002:0> collection = YAML.load_file('./lib/data.yml')
=> [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"2018-05-25"}, {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}]
```

Next, load the library.rb file

```
$ irb(main):003:0> load './lib/library.rb'
=> true
```

Now create a new library.
```
$ irb(main):004:0> lib = Library.new
=> #<Library:0x00007fd3aa1ec9d8 @collection=[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"2018-05-25"}, {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}], @client=#<Client:0x00007fd3aa1193d0 @bookshelf=[]>>
```

To search for a title or author, simply type the string into the .search command.
```
$ irb(main):005:0> lib.search('Pippi')
=> [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}]
```

In order to check out a book, use the .checkout command.
```
$ irb(main):007:0> lib.checkout('Osynligt med Alfons')
=> {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"02/18"}
```

If you'd like to see your bookshelf, use the .client command.
```
irb(main):008:0> lib.client
=> #<Client:0x00007faa821db210 @bookshelf=[{:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>"02/18"}]>

```
