require './lib/library'
require 'pry'


describe Books do
  let(:person) { instance_double('Person', name: 'Jhon')}

  it 'Check if the list book exist' do
     expect(File.exist?('./lib/books_list.yml')).to be_truthy
  end
  

  it "allows to search for all available books" do
    subject.available_books do |book|
      expect(book[:available]).to be_truthy
    end
  end
  
end

=begin
  Tests: file exist?        done
        return date
        title eq to title   done
        all books available?
it 'wefsfgewfdv' do
    expected_date = 'Disappearing Earthddddd'
    expect(subject.check_list).to eq expected_date
  end


=end
