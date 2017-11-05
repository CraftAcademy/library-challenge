require './lib/library.rb'
require 'date'

describe Library do
   let(:person) { instance_double('Person', name: 'Alfred', books: []) }
   before(:all) { @fake = YAML.load_file('./lib/data.yml') }
   before(:each) { File.open('./lib/data.yml', 'w') { |f| f.write @fake.to_yaml } }
   it 'has a collection of books on initialize' do
     expect(subject.collection).not_to be nil
   end

   it 'person can see a list of available books' do
     expect(subject.booklist).to be_kind_of(Array)
   end
   describe 'person can checkout a book' do
     before { subject.checkout('Osynligt med Alfons', person) }
     it "and persons book array isn't empty" do
       expect(person.books[0]).not_to be nil
     end
     it 'the right book has been checked out' do
       expect(person.books[0]).to include title: 'Osynligt med Alfons', author: 'Gunilla Bergström'
     end
     it 'and the availability in the library collection is set to false' do
       expect(subject.collection[2][:available]).to eq false
     end
     it 'a return date is set to library collection' do
       expect(subject.collection[2][:return_date]).to eq Date.today.next_month(1).strftime('%d/%m/%y')
     end
     it 'a return date is set to persons books' do
       expect(person.books[0]).to include return_date: Date.today.next_month(1).strftime('%d/%m/%y')
     end
     it "and can't check out book if book is already checked out" do
       expected_output = 'That book is already checked out'
       expect(subject.checkout('Osynligt med Alfons', person)).to eq expected_output
     end
   end
   describe "person can't check out book if he owns book that is expired" do
     before do
       subject.checkout('Alfons och soldatpappan', person)
       person.books[0][:return_date] = '03/12/16'
     end
     it 'and gets a warning message' do
       expected_output = 'You have a book with an expired return date. Please return it first.'
       expect(subject.checkout('Pippi Långstrump går ombord', person )).to eq expected_output
     end
   end
   describe 'person can return a book' do
     before do
       subject.checkout('Osynligt med Alfons', person)
       subject.return('Osynligt med Alfons', person)
     end
     it 'and the book is removed from persons books' do
       expect(person.books[0]).to eq nil
     end
   end
   after(:all) { File.open('./lib/data.yml', 'w') { |f| f.write @fake.to_yaml } }
end
