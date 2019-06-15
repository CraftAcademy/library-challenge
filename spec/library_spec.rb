require "./lib/library.rb"

describe Library do
    
    it 'can read the YAML file with all the books' do
        expected_output = YAML.load_file('./lib/inventory.yml')
        expect(subject.books).to eq expected_output
    end

    # it 'must return the status of the book' do
    #     expected_output =
    #     expect(subjevt)
    # end
end