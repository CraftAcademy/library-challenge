## Instructions on how to use this library
1. Create a library:
```lib = Library.new```
2. Update the collection if you have data in the YML file:
```lib.update_collection```
3. You can check the available books:
```lib.check_available_books```
4. You can add books to your collection:
```lib.add_book(title: 'red', author: 'yellow')```
5. Create a person class:
```person = Person.new(name: 'Hanna')```
6. If you want to rent a book from the library, you can use the rent method:
```person.rent_book(lib: lib, title: 'red')```
7. You can check the books you have rented and their return date:
```person.rented_books = {title: 'red', author: 'yellow', return_date: '12/04'}```
8. You can return your book to the library:
```person.return_book(lib: lib, title: 'red')```
