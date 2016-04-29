require './lib/library.rb'
describe Library do

    it 'is expected to have a catalog' do
        expect(subject.catalog).to_not eq nil   
    end
    
end     
    #it 'is expected that catalog lists books as available or checked out'
    #it 'is expected that the catalog is searchable'
    #it 'is expected that the catalog includes information about title and author'
    #it 'is expected that catalog can be shown as a list'
    #it 'is expected that checked out books have a return date 1 month away'
    #it 'is expected to have checked out books listed for person who borrowed them, incl return date'
    #it 'is expected that books can be checked out by individuals'
