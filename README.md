<h1>READ ME</h1>
<h2>for Library-Challenge, created by Pia and Becca</h2>
GitHub-repositories:
Pia's: https://github.com/piavW/library-challenge
Becca's: https://github.com/beccaburns/library-challenge

<h2>What the code does</h2>
This code creates a file including books within the library. It is possible to search the books by title and author, and has the ability to show the entire list. The visitor can see which books are available and upon check-out receives a return-date. A visitor can have a list with the current checked-out books.

<h2>Dependencies</h2>
This code is written in Ruby and is unit tested with RSpec. It is manually tested through the irb in Terminal. We've used Visual Studio Code to access and write the code. It is saved on GitHub. 

<h2>Setup</h2>
After you fork the repository, run bundle install in your Terminal and make sure you are in the project folder. That should install RSpec on your computer.

Then, from your Terminal go to the project folder and run RSpec.

To manually use it through irb in Terminal, open Terminal, "cd " your way to the repository's root-folder (library-challenge), and type the word "irb" into Terminal.

<h2>Instructions</h2>
To run the program inside irb in Terminal.

```rb 
require 'YAML'
load './lib/library.rb'
load './lib/visitor.rb'
require 'date'
```
You have now loaded the program properly. 

in irb;

Create your library and visitor through;
library = Library.new
visitor = Visitor.new

Now you can see the collection of books:
library.show_index

<h2>Acknowledgements</h2>
Thank you google, pairprogrammer, CraftAcademy coaches and amazing cohort teammates.

Help from StackOverflow answer regarding other ways to change key values within a yaml-file: https://stackoverflow.com/questions/13948951/update-value-of-key-of-a-yaml-file-in-ruby-on-rails
Explanation being: The showed method will write into yml file. If specified key ("Name") is not present in file, it will write new key value othrwise the existing one will be replaced.
    data = YAML.load_file "path/to/yml_file.yml"
    data["Name"] = ABC
    File.open("path/to/yml_file.yml", 'w') { |f| YAML.dump(data, f) }
It will write into yml file. If specified key ("Name") is not present in file, it will write new key value othrwise the existing one will be replaced.

<h2>Updates/improvements plans</h2>
We plan to refactor the code. 

<h3>License</h3>
MIT-license

<h2>User Stories</h2>

``` DONE
As a Librarian
In order to see which books exist in the library 
We need a list showing the title and author 
```

``` DONE
As a Visitor 
In order to see which books exist in the library 
We need a list showing the title and author 
```

```  DONE
As a Librarian 
In order to check if a book is available
We need a file to show book availability
```

``` DONE
As a Visitor
In order to check if a book is available
We need a be able to search for books by title and author
```

``` DONE
As a Visitor
In order to read a book
We need to be able to check-out a book from the library
```

``` DONE
As a Librarian
In order to track book check-out and return
We need the return date for the book to be a month from check-out
```

``` 
As a Visitor 
In order to know which books I checked-out 
I need a list of the books I have in possession
```

```
As a Visitor DONE
In order to return book on time
We need to know the return date
```