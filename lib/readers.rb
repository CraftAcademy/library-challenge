
    def available_to_false(desired_book)
        collection_books.
        File.open('./lib/data.yml', 'w') {|f| f.write collection_books.to_yaml}
        end
    
        
    
        def lend(num)
            @book_collection["#{num}".to_i][:available] = false
            File.open('./lib/data.yml', 'w') { |f| f.write @book_collection.to_yaml }
        end
    