# Alfreds Library Challenge

## Craft Academy Week 1

This is my solution to the Library Challenge.

### Gems Used

* rake
* rubocop
* rspec
* coveralls

### How to use the program

1. Open a ruby shell of your choice, such as irb.
2. Load the person.rb file. `load './lib/person.rb'`
3. Create a person and pass a name as an argument. `person = Person.new('Alfred')`  
`=> #<Person:0x0000000171eca0 @name="Alfred", @books=[]>`
4. Create a library. `library = Library.new`  
` => #<Library:0x00000001713670 @collection=[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]>`
5. To see what books are available, type `library.booklist`  
` => ["Alfons och soldatpappan by Gunilla Bergström", "Skratta lagom! Sa pappa Åberg by Gunilla Bergström", "Osynligt med Alfons by Gunilla Bergström", "Pippi Långstrump by Astrid Lindgren", "Pippi Långstrump går ombord by Astrid Lindgren"]`
6. To check out a book, type `library.checkout('Alfons och soldatpappan', person)`  
`=> [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"05/12/17"}]`
7. To see what books are in persons collection, type `person.books`  
` => [{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :return_date=>"05/12/17"}] `
8. To return a book, type `library.return('Alfons och soldatpappan', person)`  
` => {:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :return_date=>"05/12/17"}`
