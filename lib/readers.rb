@collection_books.each do |available:,**|
    puts available
    end
 
 
     def search_book_name(input_user)
     input_user = gets
     return @collection_books.detect{ |obj| obj[:item][:title].include? "#{input_user}" }
     end
   