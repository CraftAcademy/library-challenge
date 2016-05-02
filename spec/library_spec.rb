require './lib/library.rb'
describe Library do
  
  before do
    subject.catalog.each do |item|
      item[:available] = true
      item[:return_date] = nil
    end

  end
    it 'is expected to have a catalog' do
        expect(subject.catalog).to_not eq nil   
    end
    
    it 'is expected that books are listed as available or checked out' do
        expect(subject.catalog[rand(1..5)][:available]).to eq(true).or(eq(false))
    end
    
    it 'is expected that catalog includes title, author, status and date' do
        expected_output = { item: {title:"Pippi Långstrump", author:"Astrid Lindgren" }, 
        available: true, return_date: nil}
        expect(subject.catalog[3]).to eq expected_output 
    end

    it 'is expected that books can be checked out' do
        subject.catalog[:available] = false
        expect(subject.catalog[1..5][:available]).to eq 'Tyvärr, boken är utlånad.' 
    end
    
end     
    #it 'is expected that the catalog is searchable'
    #it 'is expected that catalog can be shown as a list'
    #it 'is expected that checked out books have a return date 1 month away'
    #it 'is expected to have checked out books listed for person who borrowed them, incl return date'
    #it 'is expected that books can be checked out by individuals'
#describe '#checkout is expected' do
#let(:person) { double('person') }
