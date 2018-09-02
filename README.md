## **Library Challenge**
### *Week 1 Ruby challenge*
-------
### Prerequisites
-------
Forked repository from https://github.com/CraftAcademy/library-challenge.

Installed gemfiles including RSPEC and PRY for testing. Bundle installed gems.


### Built With
-------
* [Ruby](https://www.ruby-lang.org/en/) - The web framework used
* [RSPEC](http://rspec.info/) - Testing framework
* [YAML](http://yaml.org/) - Data serialization


### Support Received On
-------
* Advice on creating duplicate data.yml file to enable iterative testing (Thomas)
* Support on connections of visitor class to library class variables and methods (Thomas)


### Other comments
-------
One test continues to fail ("can see the return date of books on its bookshelf"). I have tested the functionality of the code in irb many times and its works correctly - I have been unable to understand why the test is failing.


### **Overview**
-------
The purpose of this challenge is to create a prototype application to allow a newly built library to keep track of its books.


### **Library Requirements and User Stories**
-------
#### The Library program is working with the following requirements and we have identified the associated user stories.

* **Requirement #1:** 

  "We need an app where both the visitors and the library can see if a list of books is available, it would be nice to see both the title and the author of the book. 

  *User story:*
  ```
  As a visitor
  In order to choose a book to borrow
  I would like to see a list of books currently available in the library
  with information about the title and author
  ```

* **Requirement #2:** 

  "The library needs to store these books in a file where we can easily check if a book is available or not." 

  *User story:*
  ```
  As a librarian
  In order to know what books we are able to lend to visitors
  I would like to be able to be able to see the availability of books in the collection
  ```

* **Requirement #3:** 

  "The library also needs the visitors to check out books after finding the title they want." 

  *User story:*
  ```
  As a librarian
  In order to update the availability of books in the collection
  I would like to be able to allow individuals to check out a book
  ```

* **Requirement #4:** 

  "Depending on the time of the checkout the library needs the books to be returned within a month and obviously, it would be nice for the visitor to know which date to return the book."

  *User stories:*
  ```
  As a librarian
  In order to make the books available to other visitors in a timely manner
  I would like to set a return date 1 month from checkout date
  ```

  ```
  As an visitor
  In order to avoid unwanted fines, and to generally do the right thing
  I would like to know when my book is supposed to be returned
  ```


### **Example irb/PRY commands**
-------
#### **Library commands**

* **Initialise library:** 
```
library = Library.new
 => #<Library:0x007fdade9062b0 @collection=[{:item=>{:title=>"Bravo Two Zero", :author=>"Andy McNab"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"To kill a mockingbird", :author=>"Harper Lee"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pride and Predjudice", :author=>"Jane Austen"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Da Vinci Code", :author=>"Dan Brown"}, :available=>false, :return_date=>"02/10/18"}, {:item=>{:title=>"Tinker, Tailor, Soldier, Sailor", :author=>"John Le Carre"}, :available=>true, :return_date=>nil}], @visitor_bookshelf=[]> 
 ```

* **List available books in library:** 
```
library.list_availability
 => [{:item=>{:title=>"Bravo Two Zero", :author=>"Andy McNab"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"To kill a mockingbird", :author=>"Harper Lee"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pride and Predjudice", :author=>"Jane Austen"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Tinker, Tailor, Soldier, Sailor", :author=>"John Le Carre"}, :available=>true, :return_date=>nil}] 
```

* **Checkout book from library:** 
```
library.checkout("Bravo Two Zero")
 => {:title=>"Bravo Two Zero", :message=>"Book now checked out", :date_of_return=>"02/10/18"} 
```

* **Checkin book to library:** 
```
library.checkin("Bravo Two Zero")
 => {:title=>"Bravo Two Zero", :message=>"Book now available"}
```

#### **Visitor commands**

* **Initialise visitor:** 
```
visitor = Visitor.new(name: "Rupert")
 => #<Visitor:0x007fab2b816b08 @name="Rupert", @bookshelf=[], @collection=[{:item=>{:title=>"Bravo Two Zero", :author=>"Andy McNab"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"To kill a mockingbird", :author=>"Harper Lee"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pride and Predjudice", :author=>"Jane Austen"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"The Da Vinci Code", :author=>"Dan Brown"}, :available=>false, :return_date=>"02/10/18"}, {:item=>{:title=>"Tinker, Tailor, Soldier, Sailor", :author=>"John Le Carre"}, :available=>true, :return_date=>nil}]> 
```

* **Check available books:** 
```
visitor.list_availability(library)
 => [{:title=>"Bravo Two Zero", :author=>"Andy McNab"}, {:title=>"To kill a mockingbird", :author=>"Harper Lee"}, {:title=>"Pride and Predjudice", :author=>"Jane Austen"}, {:title=>"Tinker, Tailor, Soldier, Sailor", :author=>"John Le Carre"}] 
```

* **Check out book and add to bookshelf:** 
```
visitor.request_checkout("Bravo Two Zero", library)
 => [{:item=>{:title=>"Bravo Two Zero", :author=>"Andy McNab"}, :available=>false,:return_date=>"02/10/18"}]

visitor.bookshelf
 => [{:item=>{:title=>"Bravo Two Zero", :author=>"Andy McNab"}, :available=>false, :return_date=>"02/10/18"}] 
```

* **Check in book and remove from bookshelf:** 
```
visitor.request_checkin("Bravo Two Zero", library)
 => [] 

visitor.bookshelf
 => [] 
```

* **Check books on bookshelf:** 
```
visitor.bookshelf
 => [{:item=>{:title=>"Bravo Two Zero", :author=>"Andy McNab"}, :available=>false, :return_date=>"02/10/18"}] 
```

* **Check return date of specific book:** 
```
visitor.check_return_date("Bravo Two Zero")
 => "02/10/18" 
```

### **Authors**
-------
* **Rupert Lion, Shirmen Chen**