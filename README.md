# Library_challenge

---

## By Steve and Jenny

### The code:

A start application for a library to manage borrowing books. It's implementing 2 different classes:

<ul>

- The Library
  The Library has a yaml file that stores the books. It holds the title, author, availiblity, return date and account number of the user.

- The user
  The user class calls the library methods to be able to use the functions in the library.

The Librarys book list file is loaded when initializing the class. The basic functions is stored in the library, such as search, checking out and in books and printing book list.

Dependencies:<br>
RSpec is needed to run the tests available in ./spec/.
Otherwise use irb and the followed instructions in Setup.

Setup:<br>
Clone repo.
Run bundler to install gems.

Instructions:<br>
Load blabla....

Acknowledgement:<br>
Built the structure from this assignment
https://github.com/jysmys/atm_challenge_2020
Also used the Craft Academy documentation.

Updates/improvment plans:

- Add a account class
  that holds the time the user has been inactive in order to deactivate the account.
  The library should be able to create an account.
  The user should have to put in an pin code to validate account.
- An image that presents the book along with the text.

#### Licensed under MIT license
