require 'library_service'

class Customer

    def checkout
        LibraryService.checkout_service(book)
    end 
end