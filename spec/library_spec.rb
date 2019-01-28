require './lib/library.rb'

describe Library do
    let(:person) {instance_double('Person', name: 'Amanda', checked_out_book: 'Clean Code')}

    
    it 'have books in library' do
        expect(subject.collection).not_to eq nil
    end

    it 'can search a book in the database' do
        expect(subject.select_book("PC")).not_to eq nil
    end

    it 'can show which books are available' do
        expect(subject.show_available_books).not_to eq nil
    end

    it 'can show which books are checked out' do
        expect(subject.show_unavailable_books).not_to eq nil
    end


    describe '#checkout_book' do
        it 'can search for a specific book title' do
            expect(subject.select_book("Clean Code")).not_to eq nil
        end
# not passing here- undefined method or local variable for 'index'
        it 'gives an unavailable messge if already checked out' do
            expected_outcome = { message: 'Already checked out'}
            @collection[index][:available] == false
        end
    end



    # trashed test
    #describe '#checkout_book' do
    #    it 'can checkout a book after searching for its title' do
    #        expected_outcome = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title] == obj }
    #        expect(subject.checkout_book("Clean Code")).to eq expected_outcome
    #   end
    #end
    
end
