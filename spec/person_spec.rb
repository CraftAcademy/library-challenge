require './lib/library.rb'

describe Person do

   it 'expected person to be in library' do
       expect(subject.person).to_not be nil
   end

end
=begin
As an individual
In order to get my hands on a good book
I would like to see a list of books currently available in the library
with information about the title and author

As an individual
In order to avoid awkward moments at the library
I would like to know when my book is supposed to be returned

=end
