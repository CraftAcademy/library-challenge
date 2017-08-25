require './lib/library'

describe Library do
   it 'is expected to show a list of books currently available in the library' do
     expect(subject.show_books).to be_an_instance_of Array
  end
end  
