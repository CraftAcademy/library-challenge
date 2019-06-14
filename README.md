# Challenge: Book tracking system backend for library applications

## Summary
This repository contains Ruby scripts and RSpec tests for tracking a collection of books in a hypothetical library system.  The backend system must modify the book collection information appropriate to changes in 'state' of the books as patrons borrow and return the library books.  Book information is stored locally  in a YAML file.  Static data about the books includes *title* and *author*.  Dynamic information about the books includes *check-out status* and *due date*.  

## Table of Contents
1. User Stories
2. Setting Up The Project
⋅⋅⋅* Prerequisites 
⋅⋅⋅* Installation 
⋅⋅⋅* Running tests
3. Contributions
4. Versioning
5. Authors
6. Acknowledgements














### Tips
----

##### Some hints:
  * A Person needs to have a list of books that he currently has in his possession. That list needs to include the return date.
  * The return date can be calculated using the `Date` object. Out of the box, there are methods you can use to add days to the current date.
  * Make use of `doubles` when writing your specs
  * Follow the [naming conventions/standards](https://craftacademy.gitbooks.io/coding-as-a-craft/content/extras/naming_standards.html) for methods and variables

### What we are looking for
----
##### I'm hoping to see that:
* You can take a problem set and write a well tested implementation on your own.
* You understand how to define Ruby Classes and work with objects.
* You understand how classes can interact with each other.
* You know how to make use of arrays, hashes, and associated methods to create dynamic lists.
* You know how to write specs and use them as a blueprint in your development.
* I can track your work by following you commit history - so please commit as soon you are done with a feature or when you have made a test pass.

##### In your Pull Request, I'm hoping to see:
* That you are testing the right thing in the right spec file.
* That all tests passing - green is good!
* High test coverage (above 95% is accepted)
* The code is easy to follow: every class has a clear responsibility, methods are short, code is nicely formatted, etc.
* The `README.md` includes information on how to use your solution with command examples in `irb`. (Feel free to remove this text)

